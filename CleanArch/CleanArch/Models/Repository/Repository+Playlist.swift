//
//  Repository+Playlist.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

/**
 * Repository for entity Playlist
 */

import Foundation
import Moya
import ObjectMapper
import RealmSwift

// MARK: Local

extension Repository {

    func fetchPlaylists() -> Results<Playlist>? {
        return databaseClient.realm?.objects(Playlist.self).sorted(byKeyPath: "remoteSorting")
    }

    func fetchPlaylistEpisodes(playlistID: String) -> List<Audio>? {
        return databaseClient.realm?.objects(Playlist.self).filter("id == %@", playlistID).first?.audios
    }
}

// MARK: Remote web service

extension Repository {

    func requestPlaylists(session: String, callback: @escaping (UInt) -> Void) {
        networkClient.cRequestPlaylists?.cancel()
        networkClient.cRequestPlaylists = networkClient.provider.request(.listsByUser(session: session)) { [self] result in
            parsePlaylists(result: result, shouldRefresh: true, callback: callback)
        }
    }

    func requestPlaylistEpisodes(session: String, playlistID: String, page: UInt, callback: @escaping (UInt) -> Void) {
        networkClient.cRequestPlaylistEpisodes?.cancel()
        networkClient.cRequestPlaylistEpisodes = networkClient.provider.request(.audiosByList(session: session, listID: playlistID, page: page)) { [self] result in
            parsePlaylistEpisodes(result: result, shouldRefresh: page == 1, playlistID: playlistID, callback: callback)
        }
    }
}

// MARK: Private

extension Repository {
    private func parsePlaylists(result: Result<Response, MoyaError>,
                                shouldRefresh: Bool,
                                callback: @escaping (UInt) -> Void) {
        switch result {
        case let .success(response):
            do {
                let json = try response.mapJSON(failsOnEmptyData: false)
                if let items = Mapper<Playlist>().mapArray(JSONObject: json) {
                    try databaseClient.realm?.write({
                        var parsedItems: [String] = []
                        var count = shouldRefresh ? 1 : (databaseClient.realm?.objects(Playlist.self).count ?? 0) + 1
                        items.forEach { item in
                            parsedItems.append(item.id)
                            item.remoteSorting = count
                            count += 1
                            databaseClient.realm?.add(item, update: .all)
                        }

                        // Sync local with remote
                        if shouldRefresh {
                            if let oldItems = databaseClient.realm?.objects(Playlist.self).filter(NSPredicate(format: "NOT id IN %@", parsedItems)) {
                                databaseClient.realm?.delete(oldItems)
                            }
                        }

                        callback(UInt(items.count))
                    })
                }
                else {
                    callback(0)
                }
            } catch {
                #if DEBUG
                debugPrint(error)
                #endif

                callback(0)
            }
        case .failure(_):
            callback(0)
        }
    }

    func parsePlaylistEpisodes(result: Result<Response, MoyaError>,
                               shouldRefresh: Bool,
                               playlistID: String,
                               callback: @escaping (UInt) -> Void) {
        switch result {
        case let .success(response):
            do {
                if let json = (try response.mapJSON(failsOnEmptyData: false) as? Array<NSDictionary>) {
                    let jsonAudios = json.compactMap { item in item.value(forKeyPath: "audio") }
                    guard let audios = Mapper<Audio>().mapArray(JSONObject: jsonAudios) else {
                        return callback(0)
                    }

                    try databaseClient.realm?.write({
                        if let playlist = databaseClient.realm?.objects(Playlist.self).filter("id == %@", playlistID).first {
                            if shouldRefresh {
                                playlist.audios.removeAll()
                            }
                            audios.forEach { audio in
                                if let persistedAudio = databaseClient.realm?.create(Audio.self, value: audio, update: .all) {
                                    playlist.audios.append(persistedAudio)
                                }
                            }
                            databaseClient.realm?.add(playlist, update: .all)

                            callback(UInt(audios.count))
                        } else {
                            callback(0)
                        }
                    })
                }
                else {
                    callback(0)
                }
            } catch {
                #if DEBUG
                debugPrint(error)
                #endif

                callback(0)
            }
        case .failure(_):
            callback(0)
        }
    }
}

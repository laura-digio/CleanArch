//
//  PlaylistEpisodesOnFetchUseCase.swift
//  CleanArch
//
//  Created by Laura on 25/2/21.
//

import Foundation

struct PlaylistEpisodesOnFetchUseCase: BaseUseCase {
    internal let repository: Repository

    typealias Params = (playlistTitle: String, playlistID: String, page: UInt)
    typealias Response = PlaylistEpisodesInteractor.BussinessObject

    init(repository: Repository) {
        self.repository = repository
    }

    func execute(with params: (playlistTitle: String, playlistID: String, page: UInt), completion: @escaping Handler<PlaylistEpisodesInteractor.BussinessObject>) {
        // Cached data
        let items = repository.fetchPlaylistEpisodes(playlistID: params.playlistID)
        do {
            let bo = try PlaylistEpisodesBOMapper().map(input: (params.playlistTitle, items, UInt(items?.count ?? 0)))
            completion(.success(bo))
        }
        catch {
            completion(.failure(error))
        }

        // Remote data
        repository.requestPlaylistEpisodes(session: "70913185600310", playlistID: params.playlistID, page: params.page) { count in
            do {
                let audios = self.repository.fetchPlaylistEpisodes(playlistID: params.playlistID)
                let bo = try PlaylistEpisodesBOMapper().map(input: (params.playlistTitle, audios, count))
                completion(.success(bo))
            }
            catch {
                completion(.failure(error))
            }
        }
    }
}

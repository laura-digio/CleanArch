//
//  Repository+TodayListAudio.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

/**
 * Repository for entity TodayListAudio
 */

import Foundation
import RealmSwift

// MARK: Local

extension Repository {

    func fetchTodayListAudios() -> Results<TodayListAudio>? {
        return databaseClient.realm?.objects(TodayListAudio.self).sorted(byKeyPath: "remoteSorting")
    }
}

// MARK: Remote web service

extension Repository {

    func requestTodayListAudios(session: String, callback: @escaping (UInt) -> Void) {
        networkClient.cRequestTodayListAudios?.cancel()
        networkClient.cRequestTodayListAudios = networkClient.provider.request(.getAudiosLiveList(session: session)) { [self] result in
            parseAudios(model: TodayListAudio.self, result: result, callback: callback)
        }
    }
}

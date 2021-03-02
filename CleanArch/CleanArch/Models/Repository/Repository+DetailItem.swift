//
//  Repository+DetailItem.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

/*
 * Repository for entity DetailItem
 */

import Foundation
import RealmSwift

// MARK: Local

extension Repository {

    func fetchDetail(_ candidateKey: String) -> Results<DetailItem>? {
        return databaseClient.realm?.objects(DetailItem.self).filter("candidateKey == %@", candidateKey)
    }
}

// MARK: Remote web service

extension Repository {

    func requestDetail(_ username: String, callback: @escaping (UInt) -> Void) {
        networkClient.cRequestDetail?.cancel()
        networkClient.cRequestDetail = networkClient.provider.request(.detail(username: username)) { [self] result in
            parseItems(model: DetailItem.self, result: result, callback: callback)
        }
    }
}

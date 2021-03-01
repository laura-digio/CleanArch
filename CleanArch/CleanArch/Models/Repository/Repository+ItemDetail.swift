//
//  Repository+ItemDetail.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

/**
 * Repository for entity ItemDetail
 */

import Foundation
import RealmSwift

// MARK: Local

extension Repository {

    func fetchItemDetail(_ itemID: Int) -> Results<ItemDetail>? {
        return databaseClient.realm?.objects(ItemDetail.self).filter("id == %@", itemID)
    }
}

// MARK: Remote web service

extension Repository {

    func requestItemDetail(username: String, page: UInt, callback: @escaping (UInt) -> Void) {
        networkClient.cRequestItemDetails?.cancel()
        networkClient.cRequestItemDetails = networkClient.provider.request(.userRepositories(username: username)) { [self] result in
            parseItems(model: ItemDetail.self, result: result, shouldRefresh: page == 1, callback: callback)
        }
    }
}

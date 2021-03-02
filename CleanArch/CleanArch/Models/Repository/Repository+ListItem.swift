//
//  Repository+ListItem.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

/*
 * Repository for entity ListItem
 */

import Foundation
import RealmSwift

// MARK: Local

extension Repository {

    func fetchListItems() -> Results<ListItem>? {
        return databaseClient.realm?.objects(ListItem.self).sorted(byKeyPath: "remoteSorting")
    }
}

// MARK: Remote web service

extension Repository {

    func requestListItems(callback: @escaping (UInt) -> Void) {
        networkClient.cRequestListItems?.cancel()
        networkClient.cRequestListItems = networkClient.provider.request(.listItems()) { [self] result in
            parseItems(model: ListItem.self, result: result, keyPath: "items", callback: callback)
        }
    }
}

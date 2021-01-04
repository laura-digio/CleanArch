//
//  Repository+ListItems.swift
//  CleanArch
//
//  Created by Laura on 04/11/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

extension Repository {

    func fetchListItem(id: Int) -> ListItem? {
        return try! Realm().objects(ListItem.self).filter(NSPredicate(format: "id = %d", id)).first
    }
    
    func fetchListItems() -> Results<ListItem> {
        return try! Realm().objects(ListItem.self)
    }
}

extension Repository {
    
    func requestListItems(query: String, pageNumber: Int?, itemsPerPage: Int?) -> Single<[Int]> {
        let endpoint = ListItemsEndpoint(query: "", pageNumber: pageNumber, itemsPerPage: itemsPerPage)

        return NetworkClient.sharedInstance.rx_request(endpoint).flatMap { [unowned self] response -> Single<Int> in
            return self.parseListItemsResponse(response)
        }.observeOn(dbScheduler)
    }
}

extension Repository {

    private func parseListItemsResponse(_ response: ListItemsResponse) -> Single<Int> {
        return Single.create { single in
            single(.success(1))
            return Disposables.create()
        }
    }
}

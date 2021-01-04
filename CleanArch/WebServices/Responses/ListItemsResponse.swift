//
//  ListItemsResponse.swift
//  CleanArch
//
//  Created by Laura on 14/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class ListItemsResponse: Mappable {
    private(set) var totalCount: Int = 0
    private(set) var incompleteResults: Bool = false

    var items = List<ListItem>()

    required convenience init?(map: Map) {
        self.init()
    }

    // MARK: Mapping

    /**
     * Example: https://api.github.com/search/repositories?q=clean+swift&page=1&per_page=10
     */
    func mapping(map: Map) {
        totalCount <- map["total_count"]
        incompleteResults <- map["incomplete_results"]
        items <- (map["items"], ListTransform<ListItem>())
    }
}

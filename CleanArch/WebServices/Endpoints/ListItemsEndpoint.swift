//
//  ListItemsEndpoint.swift
//  CleanArch
//
//  Created by Laura on 14/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import Alamofire

class ListItemsEndpoint: Endpoint {
    private let query: String
    private let pageNumber: Int
    private let itemsPerPage: Int
    
    init(query: String, pageNumber: Int?, itemsPerPage: Int?) {
        self.query = query
        self.pageNumber = pageNumber ?? 1
        self.itemsPerPage = itemsPerPage ?? 10
    }
    
    var subpath: String {
        return "search/repositories"
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var params: [String : Any]? {
        return [
            "q": query,
            "page": pageNumber,
            "per_page": itemsPerPage
        ]
    }
}

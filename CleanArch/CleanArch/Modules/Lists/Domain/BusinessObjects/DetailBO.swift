//
//  DetailBO.swift
//  CleanArch
//
//  Created by Laura on 25/2/21.
//

import Foundation
import RealmSwift

extension DetailInteractor {

    struct BussinessObject {
        var items: Results<ItemDetail>?
        var lastCount: UInt
        let itemsPerPage = 20
        let itemTitle: String
    }
}

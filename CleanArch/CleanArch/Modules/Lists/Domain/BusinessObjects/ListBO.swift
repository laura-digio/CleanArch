//
//  ListBO.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import Foundation
import RealmSwift

extension ListInteractor {

    struct BussinessObject {
        var items: Results<ListItem>?
    }
}

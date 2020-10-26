//
//  ListItem.swift
//  CleanArch
//
//  Created by Laura on 19/10/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class ListItem: Object {
    dynamic var id = 0
    dynamic var title: String = ""
    dynamic var desc: String = ""
    dynamic var date: Date = Date()
    dynamic var _image: String?

    override static func primaryKey() -> String? {
        return "id"
    }

    var image: URL? {
        guard let _image = _image else { return nil }
        return URL(string: _image)
    }
}

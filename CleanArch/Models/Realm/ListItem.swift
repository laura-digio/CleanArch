//
//  ListItem.swift
//  CleanArch
//
//  Created by Laura on 19/10/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

@objcMembers class ListItem: Object, Mappable {
    dynamic var id: Int = 0
    dynamic var title: String = ""
    dynamic var desc: String?
    dynamic var date: Date = Date()

    private dynamic var _image: String?
    private dynamic var _link: String?

    required convenience init?(map: Map) {
        self.init()
    }

    override static func primaryKey() -> String? {
        return "id"
    }

    // MARK: Computed properties

    var image: URL? {
        get {
            if let url = _image, let image = URL(string: url) {
                return image
            }
            return nil
        }
        set {
            _image = newValue?.absoluteString
        }
    }

    var link: URL? {
        get {
            if let url = _link, let link = URL(string: url) {
                return link
            }
            return nil
        }
        set {
            _link = newValue?.absoluteString
        }
    }

    // MARK: Mapping

    func mapping(map: Map) {
        id <- map["id"]
        title <- map["name"]
        desc <- map["description"]
        date <- (map["updated_at"], DateTransformable())
        _image <- map["owner.avatar_url"]
        _link <- map["html_url"]
    }
}

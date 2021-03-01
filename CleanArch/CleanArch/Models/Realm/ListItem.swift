//
//  ListItem.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//
//  Example: https://api.github.com/users/laura-digio

import Foundation
import RealmSwift
import ObjectMapper

@objcMembers class ListItem: Object, Mappable, Model, Codable {
    dynamic var remoteSorting: Int = 1

    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var createdAt: Date?
    dynamic var updatedAt: Date?
    dynamic var numFollowers: Int = 0

    dynamic var _avatarUrl: String = ""

    required convenience init?(map: Map) {
        self.init()
    }

    override static func primaryKey() -> String? {
        return "id"
    }

    // MARK: Computed properties

    var avatarUrls: [URL] {
        var images = [URL]()
        if let image = URL(string: _avatarUrl) {
            images.append(image)
        }
        return images
    }

    // MARK: Mapping

    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        _avatarUrl <- map["avatar_url"]
        createdAt <- (map["created_at"], DateTransform())
        updatedAt <- (map["updated_at"], DateTransform())
        numFollowers <- (map["followers"], StringToIntTransform())
    }
}

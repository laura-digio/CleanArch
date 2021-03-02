//
//  ListItem.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//
//  Example: https://api.github.com/search/repositories?q=swiftui&page=1&per_page=20

import Foundation
import RealmSwift
import ObjectMapper

@objcMembers class ListItem: Object, Model {
    dynamic var remoteSorting: Int = 1

    dynamic var itemID: Int = 0
    dynamic var name: String = ""
    dynamic var desc: String?
    dynamic var createdAt: Date?
    dynamic var updatedAt: Date?
    dynamic var detailID: String = ""

    dynamic var imageString: String = ""

    required convenience init?(map: Map) {
        self.init()
    }

    override static func primaryKey() -> String? {
        return "itemID"
    }

    // MARK: Computed properties

    var image: URL? {
        URL(string: imageString)
    }

    var images: [URL] {
        guard let imageURL = image else { return [URL]() }
        return [imageURL]
    }

    // MARK: Mapping

    func mapping(map: Map) {
        itemID <- map["id"]
        name <- map["name"]
        desc <- map["description"]
        createdAt <- (map["created_at"], DateTransform())
        updatedAt <- (map["updated_at"], DateTransform())
        detailID <- map["owner.login"]
        imageString <- map["owner.avatar_url"]
    }
}

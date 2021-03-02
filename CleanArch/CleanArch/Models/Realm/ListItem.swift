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

@objcMembers class ListItem: Object, Mappable, Model, Codable {
    dynamic var remoteSorting: Int = 1

    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var desc: String?
    dynamic var createdAt: Date?
    dynamic var updatedAt: Date?
    dynamic var detailID: String = ""

    dynamic var _image: String = ""

    required convenience init?(map: Map) {
        self.init()
    }

    override static func primaryKey() -> String? {
        return "id"
    }

    // MARK: Computed properties

    var image: URL? {
        URL(string: _image)
    }

    var images: [URL] {
        guard let imageURL = URL(string: _image) else { return [URL]() }
        return [imageURL]
    }

    // MARK: Mapping

    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        desc <- map["description"]
        createdAt <- (map["created_at"], DateTransform())
        updatedAt <- (map["updated_at"], DateTransform())
        detailID <- map["owner.login"]
        _image <- map["owner.avatar_url"]
    }
}

//
//  DetailItem.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//
//  Example: https://api.github.com/users/laura-digio

import Foundation
import RealmSwift
import ObjectMapper

@objcMembers class DetailItem: Object, Mappable, Model, Codable {
    dynamic var remoteSorting: Int = 1
    
    dynamic var id: Int = 0
    dynamic var candidateKey: String = ""
    dynamic var name: String = ""
    dynamic var desc: String?
    dynamic var timestamp: Date?
    dynamic var numRepos: Int = 0

    dynamic var _image: String =  ""

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

    var timestampPretty: String {
        return timestamp?.pretty() ?? ""
    }

    // MARK: Mapping

    func mapping(map: Map) {
        id <- map["id"]
        candidateKey <- map["login"]
        name <- map["name"]
        desc <- map["bio"]
        timestamp <- (map["created_at"], DateTransform())
        numRepos <- (map["public_repos"], StringToIntTransform())
        _image <- map["avatar_url"]
    }
}

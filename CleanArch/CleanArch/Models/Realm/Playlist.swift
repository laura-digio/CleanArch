//
//  Playlist.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation
import RealmSwift
import ObjectMapper

@objcMembers class Playlist: Object, Mappable {
    dynamic var remoteSorting: Int = 1

    dynamic var id: String = ""
    dynamic var user: String = ""
    dynamic var username: String = ""
    dynamic var title: String = ""
    dynamic var desc: String?
    dynamic var _imgFile: String = ""
    dynamic var created: Date?
    dynamic var updated: Date?
    dynamic var numFollowers: Int = 0
    dynamic var numAudios: Int = 0

    let audios = List<Audio>()

    required convenience init?(map: Map) {
        self.init()
    }

    override static func primaryKey() -> String? {
        return "id"
    }

    // MARK: Computed properties

    var imgFiles: [URL] {
        var images = [URL]()
        let components = _imgFile.split(separator: ",")
        if components.count > 0 {
            components.forEach { component in
                if let image = URL(string: String(component)) {
                    images.append(image)
                }
            }
        }
        else {
            if let image = URL(string: _imgFile) {
                images.append(image)
            }
        }
        return images
    }

    // MARK: Mapping

    func mapping(map: Map) {
        id <- map["id"]
        user <- map["user"]
        username <- map["username"]
        title <- map["title"]
        desc <- map["description"]
        _imgFile <- map["imgfile"]
        created <- (map["created"], DateTransform())
        updated <- (map["updated"], DateTransform())
        numFollowers <- (map["numfollowers"], StringToIntTransform())
        numAudios <- (map["numaudios"], StringToIntTransform())
    }
}

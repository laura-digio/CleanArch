//
//  Audio.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation
import RealmSwift
import ObjectMapper

@objcMembers class Audio: Object, Mappable, Codable {
    dynamic var id: String = ""
    dynamic var title: String = ""
    dynamic var desc: String = ""
    dynamic var podcastTitle: String = ""
    dynamic var channelTitle: String = ""
    dynamic var username: String = ""
    dynamic var subcategory: String = ""
    dynamic var donation: Bool = false
    dynamic var duration: String = ""
    dynamic var timestamp: Date = Date()
    dynamic var uplodateTimestamp: Date = Date()
    dynamic var podcastId: String = ""
    dynamic var subcategoryId: String = ""
    dynamic var downloads: String = ""
    dynamic var filesize: Int = 0
    dynamic var status: String = ""
    dynamic var numComments: Int = 0
    dynamic var numRecomends: Int = 0
    dynamic var unread: Int = 0
    dynamic var adType: String =  ""
    dynamic var hosted: Bool = true
    dynamic var paid: Int = 0
    dynamic var adsFree: Int = 0
    dynamic var featured: Int = 0

    dynamic var _image: String =  ""
    dynamic var _file: String =  ""
    dynamic var _thumbnail: String =  ""
    dynamic var _imagexl: String =  ""
    dynamic var _resizableImage: String =  ""
    dynamic var _shareUrl: String =  ""
    dynamic var _contentUrl: String =  ""

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

    var uplodateTimestampPretty: String {
        return uplodateTimestamp.pretty()
    }

    var file: URL? {
        URL(string: _file)
    }

    // MARK: Mapping

    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        desc <- map["description"]
        podcastTitle <- map["podcasttitle"]
        channelTitle <- map["channeltitle"]
        username <- map["username"]
        subcategory <- map["subcategory"]
        donation <- map["donation"]
        duration <- map["duration"]
        timestamp <- (map["timestamp"], DateTransform())
        uplodateTimestamp <- (map["uplodateTimestamp"], DateTransform())
        podcastId <- map["podcastid"]
        subcategoryId <- map["subcategoryid"]
        downloads <- map["downloads"]
        filesize <- map["filesize"]
        status <- map["status"]
        numComments <- map["numcomments"]
        numRecomends <- map["numrecomends"]
        unread <- map["unread"]
        adType <- map["adtype"]
        hosted <- map["hosted"]
        paid <- map["paid"]
        adsFree <- map["adsfree"]
        featured <- map["featured"]
        _image <- map["image"]
        _file <- map["file"]
        _thumbnail <- map["thumbnail"]
        _imagexl <- map["imagexl"]
        _resizableImage <- map["resizableImage"]
        _shareUrl <- map["shareurl"]
        _contentUrl <- map["contentUrl"]
    }
}

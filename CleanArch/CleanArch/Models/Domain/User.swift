//
//  User.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

/**
 * Entity User
 */

import Foundation
import ObjectMapper

class User: Mappable, Codable {
    var email: String?
    var token: String?
    var fullName: String?

    // API
    var id: String?
    var name: String?
    var session: String?
    var isPremium: Bool = false
    var hasPremiumContract: Bool = false
    var hasPlusContract: Bool = false
    var hasProContract: Bool = false
    var skillAdsFree: Bool = false
    var skillFansFree: Bool = false
    var skillFeedToItunes: Bool = false
    var skillHideAudios: Bool = false
    var skillHideStats: Bool = false
    var skillOverTwoHours: Bool = false
    var skillProducerPro: Bool = false
    var skillRevenueShare: Bool = false
    var skillScheduledPublish: Bool = false
    var skillSelectRssLenght: Bool = false
    var skillVisibility: Bool = false
    var skillBoostVolume: Bool = false
    var skillSyncDevices: Bool = false
    var skillCarMode: Bool = false
    var skillUnlimitedSmartlists: Bool = false
    var fansFree: Int = 0
    var appType: String?

    var image: URL?
    var countryId: String?
    var countryName: String?
    var countryCode: String?
    var showGDPR: Bool = false
    var notifyComments: Bool = false
    var ip: String?

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        session <- map["session"]
        isPremium <- map["ispremium"]
        hasPremiumContract <- map["hasPremiumContract"]
        hasPlusContract <- map["hasPlusContract"]
        hasProContract <- map["hasProContract"]
        skillAdsFree <- map["skills.adsfree"]
        skillFansFree <- map["skills.skill_fansfree"]
        skillFeedToItunes <- map["skills.skill_feed_to_itunes"]
        skillHideAudios <- map["skills.skill_hide_audios"]
        skillHideStats <- map["skills.skill_hide_stats"]
        skillOverTwoHours <- map["skills.skill_over_two_hours"]
        skillProducerPro <- map["skills.producerpro"]
        skillRevenueShare <- map["skills.skill_revenueshare"]
        skillScheduledPublish <- map["skills.skill_scheduled_publish"]
        skillSelectRssLenght <- map["skills.skill_select_rss_lenght"]
        skillVisibility <- map["skills.skill_visibility"]
        skillBoostVolume <- map["skills.skill_boost_volume"]
        skillSyncDevices <- map["skills.skill_sync_devices"]
        skillCarMode <- map["skills.skill_car_mode"]
        skillUnlimitedSmartlists <- map["skills.skill_unlimited_smartlists"]
        fansFree <- map["fansfree"]
        appType <- map["appType"]
        image <- (map["image"], URLTransform())
        countryId <- map["countryId"]
        countryName <- map["countryName"]
        countryCode <- map["countryCode"]
        showGDPR <- map["showGDPR"]
        notifyComments <- map["notifyComments"]
        ip <- map["ip"]
    }
}

//
//  NetworkClientConstants.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation

struct NetworkClientConstants {

    struct Base {
        static let URL = "https://api.ivoox.com"
        static let Version = "1-4"
        static let UserAgent: String = {
            let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
            let buildVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
            let securityString = String.random(length: 4)
            return "CleanArch/\(appVersion)_\(buildVersion); \(securityString))"
        }()
    }

    enum SSOProvider: String {
        case Google = "googleSign"
        case Facebook = "facebookLogin"
        case Apple = "appleSign"
    }

    struct Function {
        static let Login = "loginApp"
        static let GetInitData = "getInitData"
        static let GetSubscriptionAudios = "getSuscriptionAudios"
        static let GetSubscriptions = "getSuscriptions"
        static let GetAudiosLiveList = "getAudiosLiveList"
        static let GetLikedAudios = "getLikedAudios"
        static let GetPendingAudios = "getPendingAudios2"
        static let ListsByUser = "getListsByUser"
        static let AudiosByList = "getAudiosByList"
    }

    enum SubscriptionsSorting: String {
        case Date = "date"
    }
}

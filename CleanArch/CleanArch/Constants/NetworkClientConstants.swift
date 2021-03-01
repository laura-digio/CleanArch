//
//  NetworkClientConstants.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation

struct NetworkClientConstants {

    struct Base {
        static let URL = "https://api.github.com"
        static let UserAgent: String = {
            let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
            let buildVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
            let securityString = String.random(length: 4)
            return "CleanArch/\(appVersion)_\(buildVersion); \(securityString))"
        }()
    }
}

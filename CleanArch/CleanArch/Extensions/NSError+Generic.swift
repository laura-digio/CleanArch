//
//  NSError+Generic.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation

extension NSError {

    static var generic: Self {
        return Self(domain: "GenericError",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: "error_generic".localized()])
    }

    static var login: Self {
        return Self(domain: "LoginModuleError",
                    code: -2,
                    userInfo: [NSLocalizedDescriptionKey: "error_login".localized()])
    }

    static var password: Self {
        return Self(domain: "LoginModuleError",
                    code: -3,
                    userInfo: [NSLocalizedDescriptionKey: "error_password".localized()])
    }

    static var singleSignOn: Self {
        return Self(domain: "LoginModuleError",
                    code: -4,
                    userInfo: [NSLocalizedDescriptionKey: "error_sso".localized()])
    }

    static var pagination: Self {
        return Self(domain: "GenericError",
                    code: -5,
                    userInfo: [NSLocalizedDescriptionKey: "error_pagination".localized()])
    }

    static var playerAsset: Self {
        return Self(domain: "PlayerModuleError",
                    code: -6,
                    userInfo: [NSLocalizedDescriptionKey: "error_player_asset_title".localized(),
                               NSLocalizedFailureReasonErrorKey: "error_player_asset".localized()])
    }

    static var playerConnection: Self {
        return Self(domain: "PlayerModuleError",
                    code: -7,
                    userInfo: [NSLocalizedDescriptionKey: "error_player_connection_title".localized(),
                               NSLocalizedFailureReasonErrorKey: "error_player_connection".localized()])
    }

    static var playerRoute: Self {
        return Self(domain: "PlayerModuleError",
                    code: -8,
                    userInfo: [NSLocalizedDescriptionKey: "error_generic".localized(),
                               NSLocalizedFailureReasonErrorKey: "error_player_route".localized()])
    }

    static func playerCustom(code: Int = -9, msg: String = "") -> Self {
        return Self(domain: "PlayerModuleError",
                    code: code,
                    userInfo: [NSLocalizedDescriptionKey: "error_generic".localized(),
                               NSLocalizedFailureReasonErrorKey: msg])
    }
}

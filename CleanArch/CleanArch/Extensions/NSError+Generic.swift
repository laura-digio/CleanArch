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
}

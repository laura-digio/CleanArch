//
//  String+Localized.swift
//  CleanArch
//
//  Created by Laura on 14/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation

extension String {

    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}

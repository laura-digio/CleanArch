//
//  String+Localized.swift
//  EAE
//
//  Created by Tony Martínez on 6/17/19
//  Copyright (c) 2019 DIGIO. All rights reserved.
//

import Foundation

extension String {

    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}

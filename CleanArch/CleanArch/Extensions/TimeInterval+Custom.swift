//
//  TimeInterval+Custom.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation

extension TimeInterval {
    var playerTime: String? {
        if self >= 3600 {
            return Formatter.playerLong.string(from: self)
        }
        else {
            return Formatter.playerShort.string(from: self)
        }
    }
}

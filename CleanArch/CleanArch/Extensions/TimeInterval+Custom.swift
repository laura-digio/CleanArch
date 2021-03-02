//
//  TimeInterval+Custom.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation

extension TimeInterval {
    var customTime: String? {
        if self >= 3600 {
            return Formatter.Long.string(from: self)
        } else {
            return Formatter.Short.string(from: self)
        }
    }
}

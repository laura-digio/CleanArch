//
//  TransformType+Custom.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation
import ObjectMapper

class StringToIntTransform: TransformType {
    typealias Object = Int
    typealias JSON = String

    func transformFromJSON(_ value: Any?) -> Object? {
        if let uValue = value as? JSON {
            return Object(uValue)
        } else if let uValue = value as? Object {
            return uValue
        }
        return nil
    }

    func transformToJSON(_ value: Object?) -> String? {
        if let uValue = value {
            return String(uValue)
        }
        return nil
    }
}

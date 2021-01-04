//
//  DateTransformable.swift
//  CleanArch
//
//  Created by Laura on 19/10/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import ObjectMapper

class DateTransformable: TransformType {
    public typealias Object = Date
    public typealias JSON = String
    
    public init() {}
    
    private static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    
    open func transformFromJSON(_ value: Any?) -> Date? {
        if let time = value as? String {
            return DateTransformable.dateFormatter.date(from: time)
        }
        
        return nil
    }
    
    open func transformToJSON(_ value: Date?) -> String? {
        if let date = value {
            return DateTransformable.dateFormatter.string(from: date)
        }
        return nil
    }
}

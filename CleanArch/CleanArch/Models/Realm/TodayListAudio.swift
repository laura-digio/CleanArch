//
//  TodayListAudio.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation
import RealmSwift

@objcMembers class TodayListAudio: Object, Model {
    dynamic var remoteSorting: Int = 1
    dynamic var id: String = ""
    dynamic var audio: Audio?

    override static func primaryKey() -> String? {
        return "id"
    }
}

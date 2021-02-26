//
//  TodayListBO.swift
//  CleanArch
//
//  Created by Laura on 17/2/21.
//

import Foundation
import RealmSwift

extension TodayListInteractor {

    struct BussinessObject {
        var audios: Results<TodayListAudio>?
    }
}

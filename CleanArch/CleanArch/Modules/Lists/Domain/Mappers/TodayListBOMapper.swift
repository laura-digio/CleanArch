//
//  TodayListBOMapper.swift
//  CleanArch
//
//  Created by Laura on 17/2/21.
//

import Foundation
import RealmSwift

final class TodayListBOMapper: BaseMapper<Results<TodayListAudio>?, TodayListInteractor.BussinessObject> {
    init() {
        super.init { input -> TodayListInteractor.BussinessObject in
            return TodayListInteractor.BussinessObject(audios: input)
        }
    }
}

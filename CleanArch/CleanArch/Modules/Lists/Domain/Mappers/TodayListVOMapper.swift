//
//  TodayListVOMapper.swift
//  CleanArch
//
//  Created by Laura on 17/2/21.
//

import Foundation

final class TodayListVOMapper: BaseMapper<TodayListInteractor.BussinessObject, TodayListView.ViewObject> {
    init() {
        super.init { input -> TodayListView.ViewObject in
            return TodayListView.ViewObject(state: input.audios?.count ?? 0 > 0 ? .idle : .placeholder,
                                            audios: input.audios)
        }
    }
}

//
//  TodayListVO.swift
//  CleanArch
//
//  Created by Laura on 17/2/21.
//

import Foundation
import RealmSwift

enum TodayListState {
    case idle
    case placeholder
}

extension TodayListView {

    class ViewObject: ObservableObject {
        @Published var state: TodayListState
        @Published var audios: Results<TodayListAudio>?

        init(state: TodayListState, audios: Results<TodayListAudio>?) {
            self.state = state
            self.audios = audios
        }

        static let placeholder = ViewObject(state: .placeholder,
                                            audios: nil)
    }
}

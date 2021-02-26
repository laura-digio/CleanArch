//
//  ListsVO.swift
//  CleanArch
//
//  Created by Laura on 16/2/21.
//

import Foundation

enum ListsState {
    case idle
}

extension ListsView {

    class ViewObject: ObservableObject {
        @Published var state: ListsState

        init(state: ListsState) {
            self.state = state
        }

        static let placeholder = ViewObject(state: .idle)
    }
}

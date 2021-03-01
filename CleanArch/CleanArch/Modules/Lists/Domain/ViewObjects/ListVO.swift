//
//  ListVO.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import Foundation
import RealmSwift

enum ListState {
    case idle
    case placeholder
}

extension ListView {

    class ViewObject: ObservableObject {
        @Published var state: ListState
        @Published var items: Results<ListItem>?

        init(state: ListState, items: Results<ListItem>?) {
            self.state = state
            self.items = items
        }

        static let placeholder = ViewObject(state: .placeholder,
                                            items: nil)
    }
}

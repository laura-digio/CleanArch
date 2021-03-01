//
//  DetailVO.swift
//  CleanArch
//
//  Created by Laura on 25/2/21.
//

import Foundation
import RealmSwift

enum DetailState {
    case idle
    case placeholder
}

extension DetailView {

    class ViewObject: ObservableObject {
        @Published var state: DetailState
        @Published var items: Results<ItemDetail>?
        @Published var loading: Bool
        @Published var itemTitle: String

        init(state: DetailState, items: Results<ItemDetail>?, loading: Bool, itemTitle: String) {
            self.state = state
            self.items = items
            self.loading = loading
            self.itemTitle = itemTitle
        }

        static let placeholder = ViewObject(state: .placeholder,
                                            items: nil,
                                            loading: false,
                                            itemTitle: "")
    }
}

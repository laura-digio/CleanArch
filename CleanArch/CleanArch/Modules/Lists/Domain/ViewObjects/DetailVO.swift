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
        @Published var viewTitle: String
        @Published var item: Results<DetailItem>?

        init(state: DetailState, viewTitle: String, item: Results<DetailItem>?) {
            self.state = state
            self.viewTitle = viewTitle
            self.item = item
        }

        static let placeholder = ViewObject(state: .placeholder,
                                            viewTitle: "",
                                            item: nil)
    }
}

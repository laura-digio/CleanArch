//
//  PlaylistsVO.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import Foundation
import RealmSwift

enum PlaylistsState {
    case idle
    case placeholder
}

extension PlaylistsView {

    class ViewObject: ObservableObject {
        @Published var state: PlaylistsState
        @Published var lists: Results<Playlist>?

        init(state: PlaylistsState, lists: Results<Playlist>?) {
            self.state = state
            self.lists = lists
        }

        static let placeholder = ViewObject(state: .placeholder,
                                            lists: nil)
    }
}

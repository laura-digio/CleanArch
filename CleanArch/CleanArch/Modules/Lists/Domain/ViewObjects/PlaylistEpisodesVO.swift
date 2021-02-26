//
//  PlaylistEpisodesVO.swift
//  CleanArch
//
//  Created by Laura on 25/2/21.
//

import Foundation
import RealmSwift

enum PlaylistEpisodesState {
    case idle
    case placeholder
}

extension PlaylistEpisodesView {

    class ViewObject: ObservableObject {
        @Published var state: PlaylistEpisodesState
        @Published var audios: List<Audio>?
        @Published var loading: Bool
        @Published var playlistTitle: String

        init(state: PlaylistEpisodesState, audios: List<Audio>?, loading: Bool, playlistTitle: String) {
            self.state = state
            self.audios = audios
            self.loading = loading
            self.playlistTitle = playlistTitle
        }

        static let placeholder = ViewObject(state: .placeholder,
                                            audios: nil,
                                            loading: false,
                                            playlistTitle: "")
    }
}

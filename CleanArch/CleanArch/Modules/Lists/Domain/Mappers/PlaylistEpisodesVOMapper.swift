//
//  PlaylistEpisodesVOMapper.swift
//  CleanArch
//
//  Created by Laura on 23/2/21.
//

import Foundation

final class PlaylistEpisodesVOMapper: BaseMapper<PlaylistEpisodesInteractor.BussinessObject, PlaylistEpisodesView.ViewObject> {
    init() {
        super.init { input -> PlaylistEpisodesView.ViewObject in
            let currentCount = input.audios?.count ?? 0
            let loading = input.lastCount == input.itemsPerPage
            return PlaylistEpisodesView.ViewObject(state: currentCount > 0 ? .idle : .placeholder,
                                                   audios: input.audios,
                                                   loading: loading,
                                                   playlistTitle: input.playlistTitle)
        }
    }
}

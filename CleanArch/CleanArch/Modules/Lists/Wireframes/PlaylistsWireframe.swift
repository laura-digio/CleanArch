//
//  PlaylistsWireframe.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import Foundation

final class PlaylistsWireframe: BaseWireframe<
    PlaylistsParams,
    PlaylistsInteractor,
    PlaylistsPresenter,
    PlaylistsView
> {
    init(params: PlaylistsParams? = nil) {
        super.init(assembly: PlaylistsAssembly(params: params))
    }
}

extension PlaylistsWireframe: PlaylistsWireframeInput {
    func playlistEpisodesView(_ playlist: Playlist) -> PlaylistEpisodesView {
        let params = PlaylistEpisodesParams(playlistID: playlist.id,
                                            playlistTitle: playlist.title)
        return PlaylistEpisodesWireframe(params: params).view
    }
}

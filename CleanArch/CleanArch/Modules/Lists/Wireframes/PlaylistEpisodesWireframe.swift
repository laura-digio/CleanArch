//
//  PlaylistEpisodesWireframe.swift
//  CleanArch
//
//  Created by Laura on 25/2/21.
//

import Foundation

final class PlaylistEpisodesWireframe: BaseWireframe<
    PlaylistEpisodesParams,
    PlaylistEpisodesInteractor,
    PlaylistEpisodesPresenter,
    PlaylistEpisodesView
> {
    init(params: PlaylistEpisodesParams? = nil) {
        super.init(assembly: PlaylistEpisodesAssembly(params: params))
    }
}

extension PlaylistEpisodesWireframe: PlaylistEpisodesWireframeInput {}

//
//  PlaylistEpisodesBOMapper.swift
//  CleanArch
//
//  Created by Laura on 23/2/21.
//

import Foundation
import RealmSwift

final class PlaylistEpisodesBOMapper: BaseMapper<(playlistTitle: String, audios: List<Audio>?, lastCount: UInt), PlaylistEpisodesInteractor.BussinessObject> {
    init() {
        super.init { input -> PlaylistEpisodesInteractor.BussinessObject in
            return PlaylistEpisodesInteractor.BussinessObject(audios: input.audios,
                                                              lastCount: input.lastCount,
                                                              playlistTitle: input.playlistTitle)
        }
    }
}

//
//  PlaylistEpisodesBO.swift
//  CleanArch
//
//  Created by Laura on 25/2/21.
//

import Foundation
import RealmSwift

extension PlaylistEpisodesInteractor {

    struct BussinessObject {
        var audios: List<Audio>?
        var lastCount: UInt
        let itemsPerPage = 20
        let playlistTitle: String
    }
}

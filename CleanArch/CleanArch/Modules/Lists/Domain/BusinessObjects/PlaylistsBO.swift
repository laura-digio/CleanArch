//
//  PlaylistsBO.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import Foundation
import RealmSwift

extension PlaylistsInteractor {

    struct BussinessObject {
        var lists: Results<Playlist>?
    }
}

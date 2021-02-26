//
//  PlaylistsBOMapper.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import Foundation
import RealmSwift

final class PlaylistsBOMapper: BaseMapper<Results<Playlist>?, PlaylistsInteractor.BussinessObject> {
    init() {
        super.init { input -> PlaylistsInteractor.BussinessObject in
            return PlaylistsInteractor.BussinessObject(lists: input)
        }
    }
}

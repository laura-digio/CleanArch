//
//  PlaylistsVOMapper.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import Foundation

final class PlaylistsVOMapper: BaseMapper<PlaylistsInteractor.BussinessObject, PlaylistsView.ViewObject> {
    init() {
        super.init { input -> PlaylistsView.ViewObject in
            let currentCount = input.lists?.count ?? 0
            return PlaylistsView.ViewObject(state: currentCount > 0 ? .idle : .placeholder,
                                            lists: input.lists)
        }
    }
}

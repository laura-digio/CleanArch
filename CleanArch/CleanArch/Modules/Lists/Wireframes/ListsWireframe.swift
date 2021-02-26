//
//  ListsWireframe.swift
//  CleanArch
//
//  Created by Laura on 16/2/21.
//

import Foundation

final class ListsWireframe: BaseWireframe<
    ListsParams,
    ListsInteractor,
    ListsPresenter,
    ListsView
> {
    init(params: ListsParams? = nil) {
        super.init(assembly: ListsAssembly(params: params))
    }
}

extension ListsWireframe: ListsWireframeInput {
    func todayListView() -> TodayListView {
        TodayListWireframe().view
    }

    func playlistsView() -> PlaylistsView {
        PlaylistsWireframe().view
    }
}

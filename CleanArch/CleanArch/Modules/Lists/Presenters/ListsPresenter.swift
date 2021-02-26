//
//  ListsPresenter.swift
//  CleanArch
//
//  Created by Laura on 16/2/21.
//

import Foundation

class ListsPresenter: BasePresenter {
    var viewInput: ListsViewInput?
    var wireframeInput: ListsWireframeInput?

    private let interactor: ListsInteractor

    init(interactor: ListsInteractor) {
        self.interactor = interactor
    }
}

extension ListsPresenter: ListsViewOutput {

    // MARK: - ROUTER

    func todayListView() -> TodayListView? {
        wireframeInput?.todayListView()
    }

    func playlistsView() -> PlaylistsView? {
        wireframeInput?.playlistsView()
    }
}

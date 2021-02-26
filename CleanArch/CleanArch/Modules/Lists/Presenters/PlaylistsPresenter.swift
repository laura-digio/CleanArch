//
//  PlaylistsPresenter.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import Foundation

class PlaylistsPresenter: BasePresenter {
    var viewInput: PlaylistsViewInput?
    var wireframeInput: PlaylistsWireframeInput?

    private let interactor: PlaylistsInteractor

    init(interactor: PlaylistsInteractor) {
        self.interactor = interactor
    }
}

extension PlaylistsPresenter: PlaylistsViewOutput {

    func onFetch() {
        interactor.onFetch { [weak self] result in
            self?.processResult(result)
        }
    }

    // MARK: - ROUTER
    func playlistEpisodesView(_ playlist: Playlist) -> PlaylistEpisodesView? {
        wireframeInput?.playlistEpisodesView(playlist)
    }
}

private extension PlaylistsPresenter {

    func processResult(_ result: Result<PlaylistsInteractor.BussinessObject, Error>) {
        switch result {
        case .success(let bo):
            do {
                let vo = try PlaylistsVOMapper().map(input: bo)
                viewInput?.refresh(vo)
            } catch {
                processFailure(error)
            }

        case .failure(let error):
            processFailure(error)
        }
    }

    func processFailure(_ error: Error) {
        #if DEBUG
        debugPrint(error.localizedDescription)
        #endif
    }
}

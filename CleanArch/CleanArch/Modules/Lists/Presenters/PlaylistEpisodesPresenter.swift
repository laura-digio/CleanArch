//
//  PlaylistEpisodesPresenter.swift
//  CleanArch
//
//  Created by Laura on 25/2/21.
//

import Foundation

class PlaylistEpisodesPresenter: BasePresenter {
    var viewInput: PlaylistEpisodesViewInput?
    var wireframeInput: PlaylistEpisodesWireframeInput?

    private let interactor: PlaylistEpisodesInteractor

    private var ssot: [Audio] = []
    private var page: UInt = 1
    private var isLastPage: Bool = false

    init(interactor: PlaylistEpisodesInteractor) {
        self.interactor = interactor
    }
}

extension PlaylistEpisodesPresenter: PlaylistEpisodesViewOutput {

    func onFetch(condition: String?) {
        if let itemID = condition {
            if isLastPage || ssot.last?.id != itemID {
                return
            }
        }
        else {
            page = 1
            ssot.removeAll()
            isLastPage = false
        }

        interactor.onFetch(page: page) { [weak self] result in
            self?.processResult(result)
        }
    }

    // MARK: - ROUTER
}

private extension PlaylistEpisodesPresenter {

    func processResult(_ result: Result<PlaylistEpisodesInteractor.BussinessObject, Error>) {
        switch result {
        case .success(let bo):
            do {
                let vo = try PlaylistEpisodesVOMapper().map(input: bo)

                if let audios = vo.audios {
                    ssot = Array(audios)
                }
                isLastPage = !vo.loading
                page += vo.loading ? 1 : 0

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

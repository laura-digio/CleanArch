//
//  PlaylistEpisodesInteractor.swift
//  CleanArch
//
//  Created by Laura on 25/2/21.
//

import Foundation

class PlaylistEpisodesInteractor: BaseInteractor {
    var useCaseExecutor: BaseUseCaseExecutor
    var params: PlaylistEpisodesParams?
    private let onFetchUseCase: PlaylistEpisodesOnFetchUseCase

    init(useCaseExecutor: BaseUseCaseExecutor,
         onFetchUseCase: PlaylistEpisodesOnFetchUseCase,
         params: PlaylistEpisodesParams?) {
        self.useCaseExecutor = useCaseExecutor
        self.onFetchUseCase = onFetchUseCase
        self.params = params
    }
}

extension PlaylistEpisodesInteractor: PlaylistEpisodesInteractorInput {

    func onFetch(page: UInt, completion: @escaping Handler<BussinessObject>) {
        useCaseExecutor.execute(onFetchUseCase, with: (params?.playlistTitle ?? "", params?.playlistID ?? "", page)) { result in
            completion(result)
        }
    }
}

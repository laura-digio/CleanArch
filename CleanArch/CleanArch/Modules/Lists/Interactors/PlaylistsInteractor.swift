//
//  PlaylistsInteractor.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import Foundation

class PlaylistsInteractor: BaseInteractor {
    var useCaseExecutor: BaseUseCaseExecutor
    var params: PlaylistsParams?
    private let onFetchUseCase: PlaylistsOnFetchUseCase

    init(useCaseExecutor: BaseUseCaseExecutor,
         onFetchUseCase: PlaylistsOnFetchUseCase,
         params: PlaylistsParams?) {
        self.useCaseExecutor = useCaseExecutor
        self.onFetchUseCase = onFetchUseCase
        self.params = params
    }
}

extension PlaylistsInteractor: PlaylistsInteractorInput {

    func onFetch(completion: @escaping Handler<BussinessObject>) {
        useCaseExecutor.execute(onFetchUseCase) { result in
            completion(result)
        }
    }
}

//
//  PlaylistsAssembly.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import Foundation

final class PlaylistsAssembly: BaseAssembly<
    PlaylistsParams,
    PlaylistsInteractor,
    PlaylistsPresenter,
    PlaylistsView
> {
    private var params: PlaylistsParams?

    override func resolve() -> PlaylistsView {
        return PlaylistsView()
    }

    override func resolve() -> PlaylistsPresenter {
        PlaylistsPresenter(interactor: resolve())
    }

    override func resolve() -> PlaylistsInteractor {
        PlaylistsInteractor(useCaseExecutor: resolve(),
                            onFetchUseCase: PlaylistsOnFetchUseCase(repository: Repository.shared),
                            params: params)
    }

    init(params: PlaylistsParams?) {
        self.params = params
        super.init()
    }
}

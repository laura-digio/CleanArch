//
//  PlaylistEpisodesAssembly.swift
//  CleanArch
//
//  Created by Laura on 25/2/21.
//

import Foundation

final class PlaylistEpisodesAssembly: BaseAssembly<
    PlaylistEpisodesParams,
    PlaylistEpisodesInteractor,
    PlaylistEpisodesPresenter,
    PlaylistEpisodesView
> {
    private var params: PlaylistEpisodesParams?

    override func resolve() -> PlaylistEpisodesView {
        return PlaylistEpisodesView()
    }

    override func resolve() -> PlaylistEpisodesPresenter {
        PlaylistEpisodesPresenter(interactor: resolve())
    }

    override func resolve() -> PlaylistEpisodesInteractor {
        PlaylistEpisodesInteractor(useCaseExecutor: resolve(),
                                   onFetchUseCase: PlaylistEpisodesOnFetchUseCase(repository: Repository.shared),
                                   params: params)
    }

    init(params: PlaylistEpisodesParams?) {
        self.params = params
        super.init()
    }
}

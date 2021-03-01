//
//  DetailAssembly.swift
//  CleanArch
//
//  Created by Laura on 25/2/21.
//

import Foundation

final class DetailAssembly: BaseAssembly<
    DetailParams,
    DetailInteractor,
    DetailPresenter,
    DetailView
> {
    private var params: DetailParams?

    override func resolve() -> DetailView {
        return DetailView()
    }

    override func resolve() -> DetailPresenter {
        DetailPresenter(interactor: resolve())
    }

    override func resolve() -> DetailInteractor {
        DetailInteractor(useCaseExecutor: resolve(),
                         onFetchUseCase: DetailOnFetchUseCase(repository: Repository.shared),
                         params: params)
    }

    init(params: DetailParams?) {
        self.params = params
        super.init()
    }
}

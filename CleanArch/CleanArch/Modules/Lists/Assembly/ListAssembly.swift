//
//  ListAssembly.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import Foundation

final class ListAssembly: BaseAssembly<
    ListParams,
    ListInteractor,
    ListPresenter,
    ListView
> {
    private var params: ListParams?

    override func resolve() -> ListView {
        return ListView()
    }

    override func resolve() -> ListPresenter {
        ListPresenter(interactor: resolve())
    }

    override func resolve() -> ListInteractor {
        ListInteractor(useCaseExecutor: resolve(),
                       onFetchUseCase: ListOnFetchUseCase(repository: Repository.shared),
                       params: params)
    }

    init(params: ListParams?) {
        self.params = params
        super.init()
    }
}

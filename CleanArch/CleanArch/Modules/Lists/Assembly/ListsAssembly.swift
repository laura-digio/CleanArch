//
//  ListsAssembly.swift
//  CleanArch
//
//  Created by Laura on 16/2/21.
//

import Foundation

final class ListsAssembly: BaseAssembly<
    ListsParams,
    ListsInteractor,
    ListsPresenter,
    ListsView
> {
    private var params: ListsParams?

    override func resolve() -> ListsView {
        return ListsView()
    }

    override func resolve() -> ListsPresenter {
        ListsPresenter(interactor: resolve())
    }

    override func resolve() -> ListsInteractor {
        ListsInteractor(useCaseExecutor: resolve(),
                        params: params)
    }

    init(params: ListsParams?) {
        self.params = params
        super.init()
    }
}

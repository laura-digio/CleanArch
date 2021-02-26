//
//  TodayListAssembly.swift
//  CleanArch
//
//  Created by Laura on 17/2/21.
//

import Foundation

final class TodayListAssembly: BaseAssembly<
    TodayListParams,
    TodayListInteractor,
    TodayListPresenter,
    TodayListView
> {
    private var params: TodayListParams?

    override func resolve() -> TodayListView {
        return TodayListView()
    }

    override func resolve() -> TodayListPresenter {
        TodayListPresenter(interactor: resolve())
    }

    override func resolve() -> TodayListInteractor {
        TodayListInteractor(useCaseExecutor: resolve(),
                            onFetchUseCase: TodayListOnFetchUseCase(repository: Repository.shared),
                            params: params)
    }

    init(params: TodayListParams?) {
        self.params = params
        super.init()
    }
}

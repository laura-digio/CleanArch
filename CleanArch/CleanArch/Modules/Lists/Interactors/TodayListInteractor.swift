//
//  TodayListInteractor.swift
//  CleanArch
//
//  Created by Laura on 17/2/21.
//

import Foundation

class TodayListInteractor: BaseInteractor {
    var useCaseExecutor: BaseUseCaseExecutor
    var params: TodayListParams?
    private let onFetchUseCase: TodayListOnFetchUseCase

    init(useCaseExecutor: BaseUseCaseExecutor,
         onFetchUseCase: TodayListOnFetchUseCase,
         params: TodayListParams?) {
        self.useCaseExecutor = useCaseExecutor
        self.onFetchUseCase = onFetchUseCase
        self.params = params
    }
}

extension TodayListInteractor: TodayListInteractorInput {

    func onFetch(completion: @escaping Handler<BussinessObject>) {
        useCaseExecutor.execute(onFetchUseCase) { result in
            completion(result)
        }
    }
}

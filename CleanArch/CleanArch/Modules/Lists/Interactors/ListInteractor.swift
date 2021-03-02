//
//  ListInteractor.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import Foundation

class ListInteractor: BaseInteractor {
    var useCaseExecutor: BaseUseCaseExecutor
    var params: ListParams?
    private let onFetchUseCase: ListOnFetchUseCase

    init(useCaseExecutor: BaseUseCaseExecutor,
         onFetchUseCase: ListOnFetchUseCase,
         params: ListParams?) {
        self.useCaseExecutor = useCaseExecutor
        self.onFetchUseCase = onFetchUseCase
        self.params = params
    }
}

extension ListInteractor: ListInteractorInput {

    func onFetch(completion: @escaping Handler<BussinessObject>) {
        useCaseExecutor.execute(onFetchUseCase) { result in
            completion(result)
        }
    }
}

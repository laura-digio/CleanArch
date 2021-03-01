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

    func onFetch(username: String, completion: @escaping Handler<BussinessObject>) {
        useCaseExecutor.execute(onFetchUseCase, with: username) { result in
            completion(result)
        }
    }
}

//
//  DetailInteractor.swift
//  CleanArch
//
//  Created by Laura on 25/2/21.
//

import Foundation

class DetailInteractor: BaseInteractor {
    var useCaseExecutor: BaseUseCaseExecutor
    var params: DetailParams?
    private let onFetchUseCase: DetailOnFetchUseCase

    init(useCaseExecutor: BaseUseCaseExecutor,
         onFetchUseCase: DetailOnFetchUseCase,
         params: DetailParams?) {
        self.useCaseExecutor = useCaseExecutor
        self.onFetchUseCase = onFetchUseCase
        self.params = params
    }
}

extension DetailInteractor: DetailInteractorInput {

    func onFetch(completion: @escaping Handler<BussinessObject>) {
        useCaseExecutor.execute(onFetchUseCase, with: (params?.viewTitle ?? "", params?.username ?? "")) { result in
            completion(result)
        }
    }
}

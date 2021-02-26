//
//  ListsInteractor.swift
//  CleanArch
//
//  Created by Laura on 16/2/21.
//

import Foundation

class ListsInteractor: BaseInteractor {
    var useCaseExecutor: BaseUseCaseExecutor
    var params: ListsParams?

    init(useCaseExecutor: BaseUseCaseExecutor, params: ListsParams?) {
        self.useCaseExecutor = useCaseExecutor
        self.params = params
    }
}

extension ListsInteractor: ListsInteractorInput {}

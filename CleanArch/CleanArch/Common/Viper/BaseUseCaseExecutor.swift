//
//  BaseExecutor.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

/*
 * ¡ArchiViper, el enemigo de MVC!
 */

import Foundation

public typealias Handler<U> = (Result<U, Error>) -> Void

public protocol BaseUseCaseExecutor {
    func execute<UseCase: BaseUseCase, U>(_ useCase: UseCase, completion: @escaping Handler<U>)
    where U == UseCase.Response

    func execute<UseCase: BaseUseCase,
                 Params,
                 U>(_ useCase: UseCase, with params: Params, completion: @escaping Handler<U>)
    where U == UseCase.Response, Params == UseCase.Params
}

struct SimpleUseCaseExecutor: BaseUseCaseExecutor {
    func execute<UseCase, U>(_ useCase: UseCase, completion: @escaping Handler<U>)
    where UseCase: BaseUseCase, U == UseCase.Response {
        useCase.execute(completion: completion)
    }

    func execute<UseCase, Params, U>(_ useCase: UseCase, with params: Params, completion: @escaping Handler<U>)
    where UseCase: BaseUseCase, Params == UseCase.Params, U == UseCase.Response {
        useCase.execute(with: params, completion: completion)
    }
}

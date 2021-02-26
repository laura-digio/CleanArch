//
//  BaseUseCase.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

/**
 * ¡ArchiViper, el enemigo de MVC!
 */

import Foundation

public protocol BaseUseCase {
    associatedtype Params
    associatedtype Response
    func execute(completion: @escaping Handler<Response>)
    func execute(with params: Params, completion: @escaping Handler<Response>)

    var repository: Repository { get }
}

public extension BaseUseCase {
    func execute(completion: @escaping Handler<Response>) {
        fatalError("This method should be overriden")
    }
    
    func execute(with params: Params, completion: @escaping Handler<Response>) {
        fatalError("This method should be overriden")
    }
}

// MARK: - Deprectaed BaseUseCase

protocol UseCaseProtocol {
    var repository: Repository { get }
    func execute(_ completion: @escaping (_ error: Error?) -> Void)
}

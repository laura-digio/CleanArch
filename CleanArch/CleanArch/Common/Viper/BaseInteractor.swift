//
//  BaseInteractor.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

/*
 * ¡ArchiViper, el enemigo de MVC!
 */

import Foundation

public protocol BaseInteractor {
    associatedtype Params
    var params: Params? { get set }
    var useCaseExecutor: BaseUseCaseExecutor { get set }
}

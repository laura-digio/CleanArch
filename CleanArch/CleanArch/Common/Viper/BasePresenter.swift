//
//  BasePresenter.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

/**
 * ¡ArchiViper, el enemigo de MVC!
 */

import Foundation

public protocol BasePresenter {
    associatedtype View
    associatedtype Wireframe
    var viewInput: View? { get set }
    var wireframeInput: Wireframe? { get set }
}

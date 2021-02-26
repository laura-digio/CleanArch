//
//  BaseProtocols.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

/**
 * ¡ArchiViper, el enemigo de MVC!
 */

import Foundation

// MARK: - ViewInput
public protocol ViewInput {
    func startLoading()
    func stopLoading()
}

public extension ViewInput {
    func startLoading() {}
    func stopLoading() {}
}

// MARK: - ViewOutput
public protocol ViewOutput {
    func loadView()
    func viewDidLoad()
    func viewDidAppear()
    func viewWillAppear()
    func viewDidDisappear()
    func didSelectDismiss()
}

public extension ViewOutput {
    func loadView() {}
    func viewDidLoad() {}
    func viewDidAppear() {}
    func viewWillAppear() {}
    func viewDidDisappear() {}
    func didSelectDismiss() {}
}

// MARK: - WireframeInput
public protocol WireframeInput {
    func dismiss()
}

public extension WireframeInput {
    func dismiss() {}
}

// MARK: - Assembly
public protocol AssemblyProtocol {}

public struct Assembly: AssemblyProtocol {
    public init() {}
}

public extension AssemblyProtocol {
    func resolve() -> BaseUseCaseExecutor {
        return SimpleUseCaseExecutor()
    }
}

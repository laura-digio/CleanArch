//
//  BaseWireframe.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

/**
 * ¡ArchiViper, el enemigo de MVC!
 */

import Foundation

open class BaseWireframe<Params,
                         Interactor: BaseInteractor,
                         Presenter: BasePresenter & ViewOutput,
                         View: BaseView>: NSObject {

    public var view: View {
        return assembly.build(wireframe: self)
    }

    public var assembly: BaseAssembly<Params, Interactor, Presenter, View>

    public init(assembly: BaseAssembly<Params, Interactor, Presenter, View>) {
        self.assembly = assembly
    }

    open func present(from fromView: View) {
        fatalError("This method should be overriden")
    }
}

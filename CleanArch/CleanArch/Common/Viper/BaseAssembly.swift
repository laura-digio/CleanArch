//
//  BaseAssembly.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

/*
 * ¡ArchiViper, el enemigo de MVC!
 */

import Foundation

open class BaseAssembly<Params,
                        Interactor: BaseInteractor,
                        Presenter: BasePresenter & ViewOutput,
                        View: BaseView> : NSObject, AssemblyProtocol {
    public weak var wireframe: NSObject?

    public override init() {}

    public func build<Wireframe: NSObject>(wireframe: Wireframe) -> View {
        self.wireframe = wireframe

        var view: View = resolve()
        var presenter: Presenter = resolve()
        presenter.viewInput = view as? Presenter.View
        presenter.wireframeInput = wireframe as? Presenter.Wireframe

        view.output = presenter as? View.Output

        return view
    }

    open func resolve() -> View {
        fatalError("This method should be overriden")
    }

    open func resolve() -> Presenter {
        fatalError("This method should be overriden")
    }

    open func resolve() -> Interactor {
        fatalError("This method should be overriden")
    }
}

//
//  MainAssembly.swift
//  CleanArch
//
//  Created by Laura on 14/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation

class MainAssembly {

    let repository = Repository.sharedInstance

    func viewMainModuleWithWireframe(_ wireframe: MainWireframe) -> MainViewController {
        let interactor = MainInteractor(repository: repository)
        let presenter = MainPresenter(interactor: interactor, wireframe: wireframe)

        let controllers = [ListWireframe().mainViewController()]
        return MainViewController(viewControllers: controllers, presenter: presenter)
    }
}

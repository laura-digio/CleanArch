//
//  ListAssembly.swift
//  CleanArch
//
//  Created by Laura on 15/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import UIKit

class ListAssembly {
    private let repository = Repository.sharedInstance

    func viewListModuleWithWireframe(_ wireframe: ListWireframe) -> UIViewController & TabbedProtocol {
        let interactor = ListInteractor(repository: repository)
        let presenter = ListPresenter(interactor: interactor, wireframe: wireframe)
        let view = ListViewController(presenter: presenter)

        return ListNavigationController(rootViewController: view)
    }
}

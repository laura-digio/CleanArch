//
//  SettingsAssembly.swift
//  CleanArch
//
//  Created by Laura on 15/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import UIKit

class SettingsAssembly {

    private let repository = Repository.sharedInstance

    func viewSettingsModuleWithWireframe(_ wireframe: SettingsWireframe) -> UIViewController & TabbedProtocol {
        let interactor = SettingsInteractor(repository: repository)
        let presenter = SettingsPresenter(interactor: interactor, wireframe: wireframe)
        let view = SettingsViewController(presenter: presenter)

        return SettingsNavigationController(rootViewController: view)
    }
}

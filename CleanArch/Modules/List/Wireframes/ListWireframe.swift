//
//  ListWireframe.swift
//  CleanArch
//
//  Created by Laura on 15/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import UIKit

class ListWireframe {

	private let assembly = ListAssembly()
    private let settingsAssembly = SettingsAssembly()

    func mainViewController() -> UIViewController & TabbedProtocol {
        return assembly.viewListModuleWithWireframe(self)
    }

    func showSettingsViewController(context: UINavigationController) {
        let vc = settingsAssembly.viewSettingsModuleWithWireframe(SettingsWireframe())
        vc.hidesBottomBarWhenPushed = true
        context.pushViewController(vc, animated: true)
    }
}

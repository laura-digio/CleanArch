//
//  MainWireframe.swift
//  CleanArch
//
//  Created by Laura on 14/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation

class MainWireframe {

	private let assembly = MainAssembly()

    func mainViewController(tabSelectedIndex: Int? = nil) -> MainViewController {
        return assembly.viewMainModuleWithWireframe(self)
    }
}

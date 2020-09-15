//
//  SettingsWireframe.swift
//  CleanArch
//
//  Created by Laura on 15/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import UIKit

class SettingsWireframe {
	private let assembly = SettingsAssembly()

    func mainViewController() -> UIViewController & TabbedProtocol {
        return assembly.viewSettingsModuleWithWireframe(self)
    }
}

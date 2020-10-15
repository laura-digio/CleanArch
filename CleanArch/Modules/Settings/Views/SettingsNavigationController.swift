//
//  SettingsNavigationController.swift
//  CleanArch
//
//  Created by Laura on 15/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import UIKit

class SettingsNavigationController: UINavigationController, TabbedProtocol {
    func tabImage() -> UIImage? {
        return Asset.Images.tabPlay.image
    }

    func tabSelectedImage() -> UIImage? {
        return Asset.Images.tabPlaySelected.image
    }

    func tabTitle() -> String? {
        return L10n.moduleSettingsTabTitle.localized()
    }
}

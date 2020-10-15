//
//  ListNavigationController.swift
//  CleanArch
//
//  Created by Laura on 15/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import UIKit

class ListNavigationController: UINavigationController, TabbedProtocol {
    func tabImage() -> UIImage? {
        return Asset.Images.tabList.image
    }

    func tabSelectedImage() -> UIImage? {
        return Asset.Images.tabListSelected.image
    }

    func tabTitle() -> String? {
        return L10n.moduleListTabTitle.localized()
    }
}

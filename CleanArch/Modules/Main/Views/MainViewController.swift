//
//  MainViewController.swift
//  CleanArch
//
//  Created by Laura on 14/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UITabBarController {
    private let presenter: MainPresenter

    init(viewControllers: [UIViewController & TabbedProtocol], presenter: MainPresenter) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)

        self.viewControllers = viewControllers
        configureTabs()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainViewController {
    private func configureTabs() {
        if let viewControllers: [UIViewController & TabbedProtocol] = self.viewControllers as? [UIViewController & TabbedProtocol] {
            for (index, viewController) in viewControllers.enumerated() {
                if let tabItem: UITabBarItem = self.tabBar.items?[index] {
                    tabItem.selectedImage = viewController.tabSelectedImage()?.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
                    tabItem.image = viewController.tabImage()?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                    tabItem.title = viewController.tabTitle()
                }
            }
        }
    }
}

//
//  BaseNavigationController.swift
//  CleanArch
//
//  Created by Laura on 16/10/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)

        navigationBar.prefersLargeTitles = true
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

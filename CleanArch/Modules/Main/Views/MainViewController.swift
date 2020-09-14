//
//  MainViewController.swift
//  CleanArch
//
//  Created by Laura on 14/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    private let presenter: MainPresenter

    init(presenter: MainPresenter) {
        self.presenter = presenter

        super.init(nibName: String.init(describing: type(of: self)), bundle: Bundle.init(for: type(of: self)))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

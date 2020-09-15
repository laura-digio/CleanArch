//
//  ListViewController.swift
//  CleanArch
//
//  Created by Laura on 15/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UIViewController {
    private let presenter: ListPresenter

    @IBOutlet weak var mainLabel: UILabel!

    init(presenter: ListPresenter) {
        self.presenter = presenter

        super.init(nibName: String.init(describing: type(of: self)), bundle: Bundle.init(for: type(of: self)))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        bindPresenter()
    }
}

extension ListViewController {
    private func configureView() {
        navigationItem.title = presenter.navigationTitle
        mainLabel.text = presenter.mainLabelText
    }

    private func bindPresenter() {}
}

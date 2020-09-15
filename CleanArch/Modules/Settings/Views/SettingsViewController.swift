//
//  SettingsViewController.swift
//  CleanArch
//
//  Created by Laura on 15/09/2020.
//

import UIKit

class SettingsViewController: UIViewController {
    private let presenter: SettingsPresenter

    init(presenter: SettingsPresenter) {
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

extension SettingsViewController {
    private func configureView() {
        navigationItem.title = presenter.navigationTitle
    }

    private func bindPresenter() {}
}

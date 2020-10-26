//
//  SettingsViewController.swift
//  CleanArch
//
//  Created by Laura on 15/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Lifecycle
class SettingsViewController: UIViewController {

    private let presenter: SettingsPresenter

    // Use "snapView" instead of "view"
    var snapView: SettingsSnapView {
        return (view as? SettingsSnapView)!
    }

    init(presenter: SettingsPresenter) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        // Do not call super!
        view = SettingsSnapView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        bindPresenter()

        presenter.enablePushNotifications()
    }
}

// MARK: - Setup
extension SettingsViewController {

    private func configureView() {
        navigationItem.title = L10n.moduleSettingsNavTitle.localized()
    }

    private func bindPresenter() {}
}

// MARK: - User Interaction
extension SettingsViewController {}

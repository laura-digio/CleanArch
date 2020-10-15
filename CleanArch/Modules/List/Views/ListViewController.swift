//
//  ListViewController.swift
//  CleanArch
//
//  Created by Laura on 15/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import UIKit

final class ListViewController: UIViewController {
    private let presenter: ListPresenter

    // Use "snapView" instead of "view"
    var snapView: ListSnapView {
        return (view as? ListSnapView)!
    }

    init(presenter: ListPresenter) {
        self.presenter = presenter

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        // Do not call super!
        view = ListSnapView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNav()
        bindPresenter()
    }
}

extension ListViewController {
    private func configureNav() {
        navigationItem.title = L10n.moduleListNavTitle.localized()
    }

    private func bindPresenter() {}
}

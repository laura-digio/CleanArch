//
//  ListViewController.swift
//  CleanArch
//
//  Created by Laura on 15/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

// MARK: - Lifecycle
final class ListViewController: UIViewController {

    private let presenter: ListPresenter
    private let bag = DisposeBag()

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

        configureView()
        bindPresenter()

        presenter.requestData()
    }
}

// MARK: - Setup
extension ListViewController {

    private func configureView() {
        navigationItem.title = L10n.moduleListNavTitle.localized()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Asset.Images.iconSettings.image,
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(rightButtonPressed(_:)))
    }

    private func bindPresenter() {
        snapView.tableView.dataSource = presenter.dataManager
        snapView.tableView.delegate = presenter.dataManager

        presenter.refreshData
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] _ in
                self?.snapView.tableView.reloadData()
            }).disposed(by: bag)
    }
}

// MARK: - User Interaction
extension ListViewController {
    
    @objc private func rightButtonPressed(_ sender: UIBarButtonItem) {
        presenter.showSettingsViewControllerWithContext(navigationController)
    }
}

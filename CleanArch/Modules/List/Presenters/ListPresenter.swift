//
//  ListPresenter.swift
//  CleanArch
//
//  Created by Laura on 15/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class ListPresenter {

    private let interactor: ListInteractor
    private let wireframe: ListWireframe

    init(interactor: ListInteractor, wireframe: ListWireframe) {
        self.interactor = interactor
        self.wireframe = wireframe
    }

    var dataManager: ListDataManager {
        return interactor.dataManager
    }

    var refreshData: Observable<Void> {
        return interactor.refreshData.map { _ in () }
    }
}

extension ListPresenter {

    func requestData() {
        interactor.requestData()
    }

    func showSettingsViewControllerWithContext(_ context: UINavigationController?) {
        guard let context = context else { return }
        wireframe.showSettingsViewController(context: context)
    }
}

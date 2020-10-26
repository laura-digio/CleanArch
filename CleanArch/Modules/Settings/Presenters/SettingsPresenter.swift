//
//  SettingsPresenter.swift
//  CleanArch
//
//  Created by Laura on 15/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import UIKit

class SettingsPresenter {

    private let interactor: SettingsInteractor
    private let wireframe: SettingsWireframe

    init(interactor: SettingsInteractor, wireframe: SettingsWireframe) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension SettingsPresenter {

    func enablePushNotifications() {
        interactor.enablePushNotifications()
    }
}

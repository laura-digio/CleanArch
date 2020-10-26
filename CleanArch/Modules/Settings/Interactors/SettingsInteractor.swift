//
//  SettingsInteractor.swift
//  CleanArch
//
//  Created by Laura on 15/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation

class SettingsInteractor {

    private let repository: Repository

    init(repository: Repository) {
        self.repository = repository
    }
}

extension SettingsInteractor {

    func enablePushNotifications() {
        repository.registerForRemoteNotifications()
    }
}

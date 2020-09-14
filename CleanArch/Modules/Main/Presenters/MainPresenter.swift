//
//  MainPresenter.swift
//  CleanArch
//
//  Created by Laura on 14/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation

class MainPresenter {
    private let interactor: MainInteractor
    private let wireframe: MainWireframe

    init(interactor: MainInteractor, wireframe: MainWireframe) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

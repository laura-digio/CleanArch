//
//  ListPresenter.swift
//  CleanArch
//
//  Created by Laura on 15/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import Foundation
import UIKit

class ListPresenter {
    private let interactor: ListInteractor
    private let wireframe: ListWireframe

    init(interactor: ListInteractor, wireframe: ListWireframe) {
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

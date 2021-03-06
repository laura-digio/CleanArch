//
//  DetailViewOutput.swift
//  CleanArch
//
//  Created by Laura on 25/2/21.
//

/*
 * Los outputs de la vista funcionan inversamente a los inputs y corresponden con aquellas acciones
 * controladas y necesarias que demanda la vista para funcionar correctamente.
 * Principalmente serán implementadas por el presenter y abarcan acciones
 * como qué hacer al pulsar un botón, pedir el refresco de datos, etc.
 */

import Foundation

protocol DetailViewOutput: ViewOutput {
    // MARK: - InteractorInput
    func onFetch()

    // MARK: - WireframeInput
}

//
//  DetailViewInput.swift
//  CleanArch
//
//  Created by Laura on 18/2/21.
//

/*
 * Los inputs de vista corresponden con aquellos métodos o variables que permiten interactuar y proporcionar
 * información de manera concreta y controlada a la vista desde la capa anterior (presenter).
 * Por ejemplo, para cargar los datos a mostrar, para mostrar/ocultar algún componente, etc.
 * Por lo tanto, la idea es diseñar la vista de tal manera (con controles de acceso privados en vars y métodos)
 * para que solamente se pueda interactuar en dirección de entrada mediante la implementación
 * de este protocolo que hereda de ViewInput.
 */

import Foundation

protocol DetailViewInput: ViewInput {
    func refresh(_ viewObject: DetailView.ViewObject)
}

//
//  ListInteractorInput.swift
//  CleanArch
//
//  Created by Laura on 18/2/21.
//

/**
 * Los inputs del interactor son aquellos métodos que permiten habitualmente al presenter (u otros interactors)
 * interactuar con el interactor para poder manejar de forma controlada y organizada la capa de negocio necesaria para el módulo.
 * Estos métodos serán los encargados de ejecutar los casos de uso disponibles,
 * siendo cada uno de éstos los que soliciten datos a un servidor, guarden información en base de datos o UserDefaults, etc.
 * Además, se recomienda hacer uso de un BusinessObject (BO) que permita transformar la información necesaria/recabada de los casos de uso
 * y comunicarla de forma controlada entre las capas conectadas del módulo (presenter e interactor),
 * con el fin de no perder la integridad del módulo y no verse influenciado por ningún tipo de objeto de dominio externo.
 *
 * Notas:
 * - ViewObject (VO): ViewController/View <-> Presenter
 * - BusinessObject (BO): Presenter <-> Interactor
 * - El mapping a BO con los datos de los casos de uso/entidades externas se hará en el interactor
 * - El mapping a VO desde un BO se hará en el presenter
 */

import Foundation

protocol ListInteractorInput {
    func onFetch(completion: @escaping Handler<ListInteractor.BussinessObject>)
}

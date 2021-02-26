//
//  ListsWireframeInput.swift
//  CleanArch
//
//  Created by Laura on 16/2/21.
//

/**
 * Los inputs del wireframe corresponden con aquellos métodos o variables que permiten interactuar y proporcionar
 * información de manera concreta y controlada al wireframe habitualmente desde el presenter.
 * Suelen llegar métodos de presentación de pantallas detalle, mostrar alertas, etc.
 */

import Foundation

protocol ListsWireframeInput: WireframeInput {
    func todayListView() -> TodayListView
    func playlistsView() -> PlaylistsView
}

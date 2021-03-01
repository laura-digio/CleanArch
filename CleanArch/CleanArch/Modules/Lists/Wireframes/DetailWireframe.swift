//
//  DetailWireframe.swift
//  CleanArch
//
//  Created by Laura on 25/2/21.
//

import Foundation

final class DetailWireframe: BaseWireframe<
    DetailParams,
    DetailInteractor,
    DetailPresenter,
    DetailView
> {
    init(params: DetailParams? = nil) {
        super.init(assembly: DetailAssembly(params: params))
    }
}

extension DetailWireframe: DetailWireframeInput {}

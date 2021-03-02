//
//  DetailVOMapper.swift
//  CleanArch
//
//  Created by Laura on 23/2/21.
//

import Foundation

final class DetailVOMapper: BaseMapper<DetailInteractor.BussinessObject, DetailView.ViewObject> {
    init() {
        super.init { input -> DetailView.ViewObject in
            return DetailView.ViewObject(state: (input.item != nil) ? .idle : .placeholder,
                                         viewTitle: input.viewTitle,
                                         item: input.item)
        }
    }
}

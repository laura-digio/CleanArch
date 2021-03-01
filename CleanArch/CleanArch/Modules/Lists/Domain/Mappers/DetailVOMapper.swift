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
            let currentCount = input.items?.count ?? 0
            let loading = input.lastCount == input.itemsPerPage
            return DetailView.ViewObject(state: currentCount > 0 ? .idle : .placeholder,
                                         items: input.items,
                                         loading: loading,
                                         itemTitle: input.itemTitle)
        }
    }
}

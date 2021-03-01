//
//  ListVOMapper.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import Foundation

final class ListVOMapper: BaseMapper<ListInteractor.BussinessObject, ListView.ViewObject> {
    init() {
        super.init { input -> ListView.ViewObject in
            let currentCount = input.items?.count ?? 0
            return ListView.ViewObject(state: currentCount > 0 ? .idle : .placeholder,
                                       items: input.items)
        }
    }
}

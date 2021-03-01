//
//  DetailBOMapper.swift
//  CleanArch
//
//  Created by Laura on 23/2/21.
//

import Foundation
import RealmSwift

final class DetailBOMapper: BaseMapper<(itemTitle: String, items: Results<ItemDetail>?, lastCount: UInt), DetailInteractor.BussinessObject> {
    init() {
        super.init { input -> DetailInteractor.BussinessObject in
            return DetailInteractor.BussinessObject(items: input.items,
                                                    lastCount: input.lastCount,
                                                    itemTitle: input.itemTitle)
        }
    }
}

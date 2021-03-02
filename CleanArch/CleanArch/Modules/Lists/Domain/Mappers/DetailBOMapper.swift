//
//  DetailBOMapper.swift
//  CleanArch
//
//  Created by Laura on 23/2/21.
//

import Foundation
import RealmSwift

final class DetailBOMapper: BaseMapper<(viewTitle: String, item: Results<DetailItem>?),
                                       DetailInteractor.BussinessObject> {
    init() {
        super.init { input -> DetailInteractor.BussinessObject in
            return DetailInteractor.BussinessObject(viewTitle: input.viewTitle,
                                                    item: input.item)
        }
    }
}

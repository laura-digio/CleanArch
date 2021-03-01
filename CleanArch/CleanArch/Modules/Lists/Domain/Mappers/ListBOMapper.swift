//
//  ListBOMapper.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import Foundation
import RealmSwift

final class ListBOMapper: BaseMapper<Results<ListItem>?, ListInteractor.BussinessObject> {
    init() {
        super.init { input -> ListInteractor.BussinessObject in
            return ListInteractor.BussinessObject(items: input)
        }
    }
}

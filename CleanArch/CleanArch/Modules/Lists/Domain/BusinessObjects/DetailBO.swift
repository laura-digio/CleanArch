//
//  DetailBO.swift
//  CleanArch
//
//  Created by Laura on 25/2/21.
//

import Foundation
import RealmSwift

extension DetailInteractor {

    struct BussinessObject {
        let viewTitle: String
        var item: Results<DetailItem>?
    }
}

//
//  ListWireframe.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import Foundation

final class ListWireframe: BaseWireframe<
    ListParams,
    ListInteractor,
    ListPresenter,
    ListView
> {
    init(params: ListParams? = nil) {
        super.init(assembly: ListAssembly(params: params))
    }
}

extension ListWireframe: ListWireframeInput {
    func detailView(_ item: ListItem) -> DetailView {
        let params = DetailParams(viewTitle: item.name,
                                  username: item.detailID)
        return DetailWireframe(params: params).view
    }
}

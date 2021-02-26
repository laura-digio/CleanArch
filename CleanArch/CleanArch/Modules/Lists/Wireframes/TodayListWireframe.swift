//
//  TodayListWireframe.swift
//  CleanArch
//
//  Created by Laura on 17/2/21.
//

import Foundation

final class TodayListWireframe: BaseWireframe<
    TodayListParams,
    TodayListInteractor,
    TodayListPresenter,
    TodayListView
> {
    init(params: TodayListParams? = nil) {
        super.init(assembly: TodayListAssembly(params: params))
    }
}

extension TodayListWireframe: TodayListWireframeInput {}

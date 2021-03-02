//
//  DetailView.swift
//  CleanArch
//
//  Created by Laura on 25/2/21.
//

import SwiftUI
import RealmSwift

struct DetailView: BaseView {
    var output: DetailViewOutput?
    @ObservedObject var viewObject: DetailView.ViewObject = .placeholder

    init() {
        viewObject.viewTitle = ""
    }

    var body: some View {
        Group {
            switch viewObject.state {
            case .idle:
                if let item = viewObject.item?.first?.freeze() {
                    contentView(item)
                }
                else {
                    placeholderView()
                }
            case .placeholder:
                placeholderView()
            }
        }
        .navigationBarTitle(viewObject.viewTitle)
        .onAppear {
            output?.onFetch()
        }
    }
}

extension DetailView: DetailViewInput {
    func refresh(_ viewObject: ViewObject) {
        self.viewObject.item = viewObject.item
        self.viewObject.viewTitle = viewObject.viewTitle
        self.viewObject.state = viewObject.state
    }
}

private extension DetailView {
    func contentView(_ item: DetailItem) -> some View {
        CustomView.DetailView(item)
    }

    func placeholderView() -> some View {
        CustomView.PlaceholderView(iconName: Assets.Icons.Favorites.rawValue,
                                   textTitle: "placeholder_item_details_title".localized(),
                                   textBody: "placeholder_item_details_body".localized())
    }
}

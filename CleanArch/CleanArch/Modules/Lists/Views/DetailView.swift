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
        viewObject.itemTitle = ""
    }

    var body: some View {
        Group {
            switch viewObject.state {
            case .idle:
                if let items = viewObject.items?.freeze() {
                    contentView(items)
                }
                else {
                    placeholderView()
                }
            case .placeholder:
                placeholderView()
            }
        }
        .navigationBarTitle(viewObject.itemTitle)
        .onAppear {
            output?.onFetch(condition: nil)
        }
    }
}

extension DetailView: DetailViewInput {
    func refresh(_ viewObject: ViewObject) {
        self.viewObject.itemTitle = viewObject.itemTitle
        self.viewObject.loading = viewObject.loading
        self.viewObject.items = viewObject.items
        self.viewObject.state = viewObject.state
    }
}

private extension DetailView {
    func contentView(_ items: RealmSwift.Results<ItemDetail>) -> some View {
        List {
            Section(footer: CustomView.LoaderView(loading: viewObject.loading)) {
                ForEach (items, id: \.id) { item in
                    CustomView.ItemDetailCell(item)
                        .onAppear {
                            output?.onFetch(condition: item.id)
                        }
                }
            }
        }
    }

    func placeholderView() -> some View {
        CustomView.PlaceholderView(iconName: Assets.Icons.Favorites.rawValue,
                                   textTitle: "placeholder_item_details_title".localized(),
                                   textBody: "placeholder_item_details_body".localized())
    }
}

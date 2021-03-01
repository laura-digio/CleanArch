//
//  ListView.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import SwiftUI
import RealmSwift

struct ListView: BaseView {
    var output: ListViewOutput?
    @ObservedObject var viewObject: ListView.ViewObject = .placeholder

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
        .navigationBarTitle("lists")
        .onAppear {
            output?.onFetch()
        }
    }
}

extension ListView: ListViewInput {
    func refresh(_ viewObject: ViewObject) {
        self.viewObject.items = viewObject.items
        self.viewObject.state = viewObject.state
    }
}

private extension ListView {
    func contentView(_ items: Results<ListItem>) -> some View {
        List (items, id: \.id) { item in
            NavigationLink(destination: output?.detailView(item)) {
                CustomView.ListItemCell(item)
            }
        }
    }

    func placeholderView() -> some View {
        CustomView.PlaceholderView(iconName: Assets.Icons.Favorites.rawValue,
                                   textTitle: "placeholder_list_items_title".localized(),
                                   textBody: "placeholder_list_items_body".localized())
    }
}

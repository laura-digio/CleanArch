//
//  ListsView.swift
//  CleanArch
//
//  Created by Laura on 16/2/21.
//

import SwiftUI

struct ListsView: BaseView {
    var output: ListsViewOutput?
    @ObservedObject var viewObject: ListsView.ViewObject = .placeholder

    var body: some View {
        Group {
            switch viewObject.state {
            case .idle:
                contentView()
            }
        }
        .navigationBarTitle("lists")
    }
}

extension ListsView: ListsViewInput {}

private extension ListsView {
    func contentView() -> some View {
        ScrollView {
            NavigationLink(destination: output?.todayListView()) {
                CustomView.Control.NavigationLink(icon: Assets.Icons.Today.rawValue,
                                                  text: "lists_today".localized())
            }
            .buttonStyle(ListButtonStyle(backgroundColor: .NavigationLink))
            NavigationLink(destination: output?.playlistsView()) {
                CustomView.Control.NavigationLink(icon: Assets.Icons.CustomLists.rawValue,
                                                  text: "lists".localized())
            }
            .buttonStyle(ListButtonStyle(backgroundColor: .NavigationLink))
        }
    }
}

//
//  PlaylistsView.swift
//  CleanArch
//
//  Created by Laura on 24/2/21.
//

import SwiftUI
import RealmSwift

struct PlaylistsView: BaseView {
    var output: PlaylistsViewOutput?
    @ObservedObject var viewObject: PlaylistsView.ViewObject = .placeholder

    var body: some View {
        Group {
            switch viewObject.state {
            case .idle:
                if let items = viewObject.lists?.freeze() {
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

extension PlaylistsView: PlaylistsViewInput {
    func refresh(_ viewObject: ViewObject) {
        self.viewObject.lists = viewObject.lists
        self.viewObject.state = viewObject.state
    }
}

private extension PlaylistsView {
    func contentView(_ items: Results<Playlist>) -> some View {
        List (items, id: \.id) { item in
            NavigationLink(destination: output?.playlistEpisodesView(item)) {
                CustomView.PlaylistCell(item)
            }
        }
    }

    func placeholderView() -> some View {
        CustomView.PlaceholderCompactView(iconName: Assets.Icons.CustomLists.rawValue,
                                          textTitle: "placeholder_playlists".localized(),
                                          textBody: "placeholder_playlists_body".localized())
    }
}

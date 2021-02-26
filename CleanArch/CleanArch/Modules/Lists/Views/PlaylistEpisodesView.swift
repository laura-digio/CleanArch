//
//  PlaylistEpisodesView.swift
//  CleanArch
//
//  Created by Laura on 25/2/21.
//

import SwiftUI
import RealmSwift

struct PlaylistEpisodesView: BaseView {
    var output: PlaylistEpisodesViewOutput?
    @ObservedObject var viewObject: PlaylistEpisodesView.ViewObject = .placeholder

    init() {
        viewObject.playlistTitle = ""
    }

    var body: some View {
        Group {
            switch viewObject.state {
            case .idle:
                if let items = viewObject.audios?.freeze() {
                    contentView(items)
                }
                else {
                    placeholderView()
                }
            case .placeholder:
                placeholderView()
            }
        }
        .navigationBarTitle(viewObject.playlistTitle)
        .onAppear {
            output?.onFetch(condition: nil)
        }
    }
}

extension PlaylistEpisodesView: PlaylistEpisodesViewInput {
    func refresh(_ viewObject: ViewObject) {
        self.viewObject.playlistTitle = viewObject.playlistTitle
        self.viewObject.loading = viewObject.loading
        self.viewObject.audios = viewObject.audios
        self.viewObject.state = viewObject.state
    }
}

private extension PlaylistEpisodesView {
    func contentView(_ items: RealmSwift.List<Audio>) -> some View {
        List {
            Section(footer: CustomView.LoaderView(loading: viewObject.loading)) {
                ForEach (items, id: \.id) { item in
                    CustomView.AudioCell(item)
                        .onAppear {
                            output?.onFetch(condition: item.id)
                        }
                }
            }
        }
    }

    func placeholderView() -> some View {
        CustomView.PlaceholderCompactView(iconName: Assets.Icons.CustomLists.rawValue,
                                          textTitle: "placeholder_playlist_episodes".localized(),
                                          textBody: "placeholder_playlist_episodes_body".localized())
    }
}

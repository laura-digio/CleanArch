//
//  TodayListView.swift
//  CleanArch
//
//  Created by Laura on 17/2/21.
//

import SwiftUI
import RealmSwift

struct TodayListView: BaseView {
    var output: TodayListViewOutput?
    @ObservedObject var viewObject: TodayListView.ViewObject = .placeholder

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
        .navigationBarTitle("lists_today")
        .onAppear {
            output?.onFetch()
        }
    }
}

extension TodayListView: TodayListViewInput {
    func refresh(_ viewObject: ViewObject) {
        self.viewObject.audios = viewObject.audios
        self.viewObject.state = viewObject.state
    }
}

private extension TodayListView {
    func contentView(_ items: Results<TodayListAudio>) -> some View {
        List (items, id: \.id) { item in
            if let audio = item.audio {
                CustomView.AudioCell(audio)
            }
        }
    }

    func placeholderView() -> some View {
        CustomView.PlaceholderCompactView(iconName: Assets.Icons.Today.rawValue,
                                          textTitle: "placeholder_today".localized(),
                                          textBody: "placeholder_today_body".localized())
    }
}

//
//  AppState.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation

final class AppState: Codable {
    private enum CodingKeys: CodingKey {
        case selectedTab
    }

    @Published var selectedTab: Int = 1 {
        didSet {
            let notificationName = Notification.Name(AppConstants.NotificationCenter.Keys.popToRoot.rawValue)
            NotificationCenter.default.post(name: notificationName, object: self, userInfo: nil)
        }
    }

    init() {}

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        selectedTab = try container.decode(Int.self, forKey: .selectedTab)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(selectedTab, forKey: .selectedTab)
    }
}

extension AppState {
    func persist() {
        UserDefaults.appState = self
    }
}

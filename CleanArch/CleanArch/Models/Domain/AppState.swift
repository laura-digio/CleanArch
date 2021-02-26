//
//  AppState.swift
//  CleanArch
//
//  Created by Laura on 12/1/21.
//

import Foundation

final class AppState: Codable {
    var shouldSync: Bool = true

    private enum CodingKeys: CodingKey {
        case selectedTab
        case voiceBoostEnabled
        case playerRate
    }

    @Published var selectedTab: Int = 1 {
        didSet {
            let notificationName = Notification.Name(AppConstants.NotificationCenter.Keys.popToRoot.rawValue)
            NotificationCenter.default.post(name: notificationName, object: self, userInfo: nil)
        }
    }

    // MARK: - Settings
    @Published var voiceBoostEnabled: Bool = false
    @Published var playerRate: Float = 1.0

    init() {}

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        voiceBoostEnabled = try container.decode(Bool.self, forKey: .voiceBoostEnabled)
        playerRate = try container.decode(Float.self, forKey: .playerRate)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(voiceBoostEnabled, forKey: .voiceBoostEnabled)
        try container.encode(playerRate, forKey: .playerRate)
    }
}

extension AppState {
    func persist() {
        UserDefaults.appState = self
    }
}

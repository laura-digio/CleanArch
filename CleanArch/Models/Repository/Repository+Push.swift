//
//  Repository+Push.swift
//  CleanArch
//
//  Created by Laura on 17/09/2020.
//

import Foundation
import UserNotifications
import UIKit
import Firebase

extension Repository {

    func registerForRemoteNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                debugPrint(error as Any)
            }
        }
    }

    func sendTokenToServer(_ token: String) {
        debugPrint("Firebase registration token: \(token)")
    }

    func handleRemoteNotification(_ userInfo: [AnyHashable: Any],
                                  completionHandler: ((UIBackgroundFetchResult) -> Void)? = nil) {
        debugPrint(userInfo)

        if let _completionHandler = completionHandler {
            _completionHandler(UIBackgroundFetchResult.newData)
        }
    }
}

//
//  Repository+Push.swift
//  CleanArch
//
//  Created by Laura on 17/09/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
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
                #if DEBUG
                debugPrint(error as Any)
                #endif
            }
        }
    }

    func sendTokenToServer(_ token: String) {
        #if DEBUG
        debugPrint("Firebase registration token: \(token)")
        #endif
    }

    func handleRemoteNotification(_ userInfo: [AnyHashable: Any],
                                  completionHandler: ((UIBackgroundFetchResult) -> Void)? = nil) {
        #if DEBUG
        debugPrint("application didReceiveRemoteNotification: \(userInfo)")
        #endif

        if let _completionHandler = completionHandler {
            _completionHandler(UIBackgroundFetchResult.newData)
        }
    }
}

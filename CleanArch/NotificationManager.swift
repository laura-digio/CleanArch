//
//  NotificationManager.swift
//  CleanArch
//
//  Created by Laura on 16/09/2020.
//

import Foundation
import UserNotifications
import Firebase
import UIKit

class NotificationManager: NSObject, UNUserNotificationCenterDelegate, MessagingDelegate {
    // Singleton
    static let shared = NotificationManager()

    /**
     * Register for remote notifications
     */
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

    /**
     * Monitor FCM registration token refresh
     */
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        debugPrint("Firebase registration token: \(fcmToken)")

        // Send token to server-side
    }
}

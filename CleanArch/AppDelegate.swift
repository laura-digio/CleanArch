//
//  AppDelegate.swift
//  CleanArch
//
//  Created by Laura on 16/07/2020.
//  Copyright © 2020 DIGIO. All rights reserved.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        if #available(iOS 13.0, *) {
            // See SceneDelegate
        } else {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = MainWireframe().mainViewController()
            window?.makeKeyAndVisible()
        }

        // Initialize Firebase in your app
        FirebaseApp.configure()

        // Delegate to handle FCM token refreshes, and remote data messages received via FCM direct channel.
        Messaging.messaging().delegate = self

        // The object that processes incoming notifications and notification-related actions.
        UNUserNotificationCenter.current().delegate = self

        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running,
        // this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

// MARK: - MessagingDelegate
extension AppDelegate {
    /**
     * Monitor FCM registration token refresh
     */
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        Repository.sharedInstance.sendTokenToServer(fcmToken)
    }
}

// MARK: - UIApplicationDelegate - Remote Notifications
extension AppDelegate {
    /**
     * Monitor APNs token refresh
     */
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        debugPrint("Apple Push Notification service (APNs) device token: \(token)")
    }

    /**
     * Silent remote notifications
     *
     * This delegate method offers an opportunity for applications with the "remote-notification" background mode
     * to fetch appropriate new data in response to an incoming remote notification.
     * You should call the fetchCompletionHandler as soon as you're finished performing that operation,
     * so the system can accurately estimate its power and data cost.
     */
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        Repository.sharedInstance.handleRemoteNotification(userInfo, completionHandler: completionHandler)
    }
}

// MARK: - UNUserNotificationCenterDelegate
extension AppDelegate {
    /**
     * User visible notifications
     * Asks the delegate how to handle a notification that arrived while the app was running in the foreground.
     */
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        debugPrint("userNotificationCenter willPresent notification: \(notification)")
        completionHandler([.alert, .sound, .badge])
    }

    /**
    * User visible notifications
    * Asks the delegate to process the user's response to a delivered notification.
    * If you do not implement this method, your app never responds to custom actions.
    */
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        debugPrint("userNotificationCenter didReceive response: \(response)")
        completionHandler()
    }
}

//
//  AppDelegate.swift
//  CleanArch
//
//  Created by Laura on 16/07/2020.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = MainWireframe().mainViewController()
        self.window?.makeKeyAndVisible()

        // Initialize Firebase in your app
        FirebaseApp.configure()

        // Delegate to handle FCM token refreshes, and remote data messages received via FCM direct channel.
        Messaging.messaging().delegate = NotificationManager.shared

        // The object that processes incoming notifications and notification-related actions.
        UNUserNotificationCenter.current().delegate = NotificationManager.shared

        return true
    }

    /**
     * Monitor APNs token refresh
     */
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        debugPrint("Apple Push Notification service (APNs) device token: \(token)")
    }

    /**
     * Handle FCM messages:
     * When your app is in the background, iOS directs messages with the notification key to the system tray.
     * A tap on a notification opens the app, and the content of the notification is passed here.
     *
     * If you are receiving a notification message while your app is in the background,
     * this callback will not be fired till the user taps on the notification launching the application.
     */
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        debugPrint(userInfo)
    }

    /**
     * Use this method to process incoming remote notifications for your app.
     * Unlike the application(_:didReceiveRemoteNotification:) method,
     * which is called only when your app is running in the foreground,
     * the system calls this method when your app is running in the foreground or background.
     * In addition, if you enabled the remote notifications background mode,
     * the system launches your app (or wakes it from the suspended state)
     * and puts it in the background state when a remote notification arrives.
     *
     * However, the system does not automatically launch your app if the user has force-quit it.
     * In that situation, the user must relaunch your app or restart the device
     * before the system attempts to launch your app automatically again.
     */
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        debugPrint(userInfo)

        completionHandler(UIBackgroundFetchResult.newData)
    }
}

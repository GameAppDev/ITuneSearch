//
//  AppDelegate+Notifications.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit
import UserNotifications

extension AppDelegate {
    
    func applicationInit(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) {
        application.applicationIconBadgeNumber = 0
        
        let center = UNUserNotificationCenter.current()
        center.removeAllDeliveredNotifications()
        center.removeAllPendingNotificationRequests()
    }
    
    func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: Error
    ) {
        debugPrint("<--- didFailToRegisterForRemoteNotificationsWithError --->")
    }
    
    func application(
        _ application: UIApplication,
        didReceiveRemoteNotification userInfo: [AnyHashable: Any],
        fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
    ) {
        if let notificationData = userInfo[ "notification_data"] as? [String: Any],
           let action = notificationData["action"] as? [String: Any],
           let urlString = action["url"] as? String,
           let url = URL(string: urlString) {
            debugPrint("<--- url: \(url) --->")
            // TODO: AppRouter.shared.handleUrl(url)
        }
    }
    
    func registerForPushNotifications(
        _ application: UIApplication = UIApplication.shared
    ) {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.delegate = self
        
        let authOptions: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        notificationCenter.requestAuthorization(options: authOptions) { granted, error in
            debugPrint("<--- error: \(String(describing: error) )- granted: \(granted) --->")
            if granted {
                DispatchQueue.main.async(execute: {
                    UIApplication.shared.registerForRemoteNotifications()
                })
            }
        }
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    // MARK: Push Notification on foreground
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler(.sound)
    }
    
    // MARK: Push Notification clicked
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        // TODO: Handle Notification
    }
}

//
//  AppDelegate.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        applicationInit(application, didFinishLaunchingWithOptions: launchOptions)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        AppRouter.shared.openApp()
        
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        checkATTPermission {
            debugPrint("<--- ATTPermission authorized --->")
        }
    }
}

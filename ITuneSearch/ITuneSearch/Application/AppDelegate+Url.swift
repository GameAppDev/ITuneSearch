//
//  AppDelegate+Url.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

extension AppDelegate {
    
    // MARK: For Deep Links
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
    ) -> Bool {
        return AppRouter.shared.handleUrl(url)
    }
    
    // MARK: For Universal Links
    func application(
        _ application: UIApplication,
        continue userActivity: NSUserActivity,
        restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void
    ) -> Bool {
        guard let url = userActivity.webpageURL
        else { return false }
        
        return AppRouter.shared.handleUrl(url)
    }
}

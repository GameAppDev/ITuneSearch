//
//  AppDelegate+ATT.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import AppTrackingTransparency

extension AppDelegate {
    
    func checkATTPermission(runBlock: @escaping (() -> Void)) {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                    runBlock()
                default:
                    debugPrint("<--- Needs ATTPermission --->")
                }
            }
        } else {
            runBlock()
        }
    }
}

//
//  Bundle+Ext.swift
//  ITSUtils
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

extension Bundle {

    public var appName: String {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? "app_name".localized
    }
    
    public var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    public var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}

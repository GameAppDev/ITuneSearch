//
//  NSObject+Ext.swift
//  ITSUtils
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

extension NSObject {
    
    class var className: String {
        return String(describing: self)
    }
}

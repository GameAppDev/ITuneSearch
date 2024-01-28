//
//  String+Ext.swift
//  ITSUtils
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

extension String {
    
    public func trim() -> String {
        return trimmingCharacters(in: CharacterSet.whitespaces)
    }
    
    public func removeSpaces() -> String {
        return replacingOccurrences(of: " ", with: "")
    }
    
    public func replace(targetChar: String, withChar: String) -> String {
        return replacingOccurrences(of: targetChar, with: withChar)
    }
    
    public func toUrlEncodedFormat() -> String? {
        return replacingOccurrences(of: " ", with: "+")
    }
}

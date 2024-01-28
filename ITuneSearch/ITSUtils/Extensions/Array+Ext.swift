//
//  Array+Ext.swift
//  ITSUtils
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

extension Array {
    
    public subscript (safe index: Index) -> Element? {
        return (0 <= index && index < count) ? self[index] : nil
    }
    
    public var isNotEmpty: Bool {
        return !isEmpty
    }

    public mutating func removeObject<T: Equatable>(_ object: T) {
        if let index = firstIndex(where: { $0 as? T == object }) {
            remove(at: index)
        }
    }

    public mutating func removeElement<U: AnyObject>(_ element: U) {
        if let index = firstIndex(where: { $0 as? U === element }) {
            remove(at: index)
        }
    }
}

extension Sequence where Element: Hashable {
    
    public func uniqued() -> [Element] {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}

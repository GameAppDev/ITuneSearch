//
//  UIView+Ext.swift
//  ITSUtils
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

extension UIView {
    
    public func findViewController() -> UIViewController? {
        if let nextResponder = next as? UIViewController {
            return nextResponder
        } else if let nextResponder = next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}

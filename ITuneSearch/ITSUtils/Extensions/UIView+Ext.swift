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
    
    public func loadNib<T: UIView>() -> T? {
        let nib = UINib(nibName: type(of: self).className,
                        bundle: Bundle(for: type(of: self)))
        return nib.instantiate(
            withOwner: T.self,
            options: nil
        ).first as? T
    }
}

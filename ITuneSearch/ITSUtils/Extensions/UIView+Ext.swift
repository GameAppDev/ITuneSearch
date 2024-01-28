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
    
    public func setShadow(color: UIColor, opacity: Float, offSet: CGSize, radius: CGFloat) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            layer.masksToBounds = false
            layer.shadowColor = color.cgColor
            layer.shadowOpacity = opacity
            layer.shadowOffset = offSet
            layer.shadowRadius = radius
            layer.shadowPath = UIBezierPath(rect: bounds).cgPath
            layer.shouldRasterize = true
            layer.rasterizationScale = UIScreen.main.scale
        }
    }
    
    public func roundAllCorners(radius: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = radius
    }
}

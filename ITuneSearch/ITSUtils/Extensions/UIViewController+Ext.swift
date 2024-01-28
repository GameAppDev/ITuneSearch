//
//  UIViewController+Ext.swift
//  ITSUtils
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

extension UIViewController {
    
    public func resetNavigationBar() {
        navigationItem.setHidesBackButton(true, animated: false)
        navigationController?.view.backgroundColor = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    public func getNavigationBarFrame() -> CGRect {
        let topSAInsets = navigationController?.view.safeAreaInsets.top ?? 0

        return .init(
            x: 0,
            y: -topSAInsets,
            width: navigationController?.navigationBar.bounds.width ?? 0,
            height: (navigationController?.navigationBar.bounds.height ?? 0) + topSAInsets
        )
    }
    
    public func addNavigationBarView(navBarView: UIView) {
        navigationController?.navigationBar.subviews.forEach({ $0.removeFromSuperview() })

        if let isContainsNavBarView = navigationController?.navigationBar.subviews.contains(navBarView),
           !isContainsNavBarView {
            navigationController?.navigationBar.addSubview(navBarView)
        }
        navBarView.layoutIfNeeded()
    }
    
    public func removeAllChildrenVC() {
        children.forEach({
          $0.willMove(toParent: nil)
          $0.view.removeFromSuperview()
          $0.removeFromParent()
        })
    }
}

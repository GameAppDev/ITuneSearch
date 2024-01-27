//
//  UINavigationController+Ext.swift
//  ITSUtils
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

extension UINavigationController {
    
    public var rootViewController: UIViewController? {
        return viewControllers.first
    }

    public func push(
        _ viewController: UIViewController,
        animated: Bool = true
    ) {
        pushViewController(viewController, animated: animated)
    }
    
    public func popBack(
        to index: Int,
        animated: Bool = false
    ) {
        let newIndex = index + 1 // + 1 due to the array index
        let viewControllers: [UIViewController] = viewControllers
        guard viewControllers.count < newIndex else {
            popToViewController(
                viewControllers[viewControllers.count - newIndex],
                animated: animated
            )
            return
        }
    }
    
    public func popToRoot(animated: Bool = false) {
        if let rootVC = rootViewController {
            popToViewController(rootVC, animated: animated)
        }
    }

    public func removeCurrentAndPush(_ viewController: UIViewController) {
        let currentViewController = viewControllers.last
        push(viewController)
        viewControllers.removeObject(currentViewController)
    }
}

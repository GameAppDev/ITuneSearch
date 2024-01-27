//
//  RootRouter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

final class RootRouter {
    
    // MARK: Properties
    weak var view: UIViewController?
    
    // MARK: Static Method
    static func returnVC() -> UIViewController {
        return RootBuilder.buildModule()
    }
}

extension RootRouter: IRootPresenterToRouter {
    
    func setTabBarRoutes(_ tabBarItems: [TabBarItem]) {
        guard let view,
              let rootVC = view as? RootViewController
        else { return }
        
        rootVC.viewControllers = tabBarItems.map {
            let controller = UINavigationController(rootViewController: $0.controller)
            controller.tabBarItem = UITabBarItem(title: $0.title,
                                                 image: $0.image,
                                                 selectedImage: $0.selectedImage)
            controller.tabBarItem.isEnabled = $0.isEnabled
            return controller
        }
    }
}

//
//  RootViewController.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

final class RootViewController: UITabBarController {
    
    // MARK: Properties
    var presenter: IRootViewToPresenter?
}

extension RootViewController: IRootPresenterToView {
    
    func setupTabBar() {
        delegate = self
        setValue(UITabBar(frame: tabBar.frame), forKey: "tabBar")
    }
    
    func setTabBarSelectedIndex(_ index: Int) {
        selectedIndex = index
    }
}

extension RootViewController: UITabBarControllerDelegate {
    
    func tabBarController(
        _ tabBarController: UITabBarController,
        didSelect viewController: UIViewController
    ) {
        presenter?.handleTabBarItemSelection(
            selectedIndex: tabBarController.selectedIndex
        )
    }
}

// MARK: Lifecycle
extension RootViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

//
//  RootContractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

protocol IRootPresenterToView: AnyObject {
    func setupTabBar()
    func setTabBarSelectedIndex(_ index: Int)
}

protocol IRootViewToPresenter: AnyObject {
    func viewDidLoad()
    func handleTabBarItemSelection(selectedIndex: Int)
}

protocol IRootPresenterToInteractor: AnyObject { }

protocol IRootInteractorToPresenter: AnyObject { }

protocol IRootPresenterToRouter: AnyObject {
    func setTabBarRoutes(_ tabBarItems: [TabBarItem])
}

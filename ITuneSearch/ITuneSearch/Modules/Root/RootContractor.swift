//
//  RootContractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

protocol IRootPresenterToView: IPresenterToView {
    func setupTabBar()
    func setTabBarSelectedIndex(_ index: Int)
}

protocol IRootViewToPresenter: IViewToPresenter {
    func handleTabBarItemSelection(selectedIndex: Int)
}

protocol IRootPresenterToInteractor: IPresenterToInteractor { }

protocol IRootInteractorToPresenter: IInteractorToPresenter { }

protocol IRootPresenterToRouter: IPresenterToRouter {
    func setTabBarRoutes(_ tabBarItems: [TabBarItem])
}

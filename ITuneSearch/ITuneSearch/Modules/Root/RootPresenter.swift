//
//  RootPresenter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

final class RootPresenter {
    
    // MARK: Properties
    weak var view: IRootPresenterToView?
    var interactor: IRootPresenterToInteractor?
    var router: IRootPresenterToRouter?
}

extension RootPresenter: IRootViewToPresenter {
    
    func viewDidLoad() {
        router?.setTabBarRoutes(TabBarItem.allCases)
        view?.setupTabBar()
        view?.setTabBarSelectedIndex(0)
    }
    
    func handleTabBarItemSelection(selectedIndex: Int) {
        let selectedTabItem = TabBarItem.allCases.first(where: { $0.index == selectedIndex })
        debugPrint("<--- TabBar Item: \(selectedTabItem?.title ?? selectedIndex.toString()) --->")
    }
}

extension RootPresenter: IRootInteractorToPresenter { }

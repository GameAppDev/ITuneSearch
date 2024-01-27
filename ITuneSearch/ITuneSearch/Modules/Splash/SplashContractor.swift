//
//  SplashContractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

protocol ISplashPresenterToView: IPresenterToView { }

protocol ISplashViewToPresenter: IViewToPresenter { }

protocol ISplashPresenterToInteractor: IPresenterToInteractor { }

protocol ISplashInteractorToPresenter: IInteractorToPresenter { }

protocol ISplashPresenterToRouter: IPresenterToRouter {
    func navigateToRoot()
    func navigateToSearchMain()
}

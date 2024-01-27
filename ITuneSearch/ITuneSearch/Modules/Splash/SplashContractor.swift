//
//  SplashContractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

protocol ISplashPresenterToView: AnyObject { }

protocol ISplashViewToPresenter: AnyObject { }

protocol ISplashPresenterToInteractor: AnyObject {
    func fetchSearch()
}

protocol ISplashInteractorToPresenter: AnyObject {
    func searchFetchedOnSuccess()
    func searchFetchedOnError()
}

protocol ISplashPresenterToRouter: AnyObject {
    func navigateToRoot()
}

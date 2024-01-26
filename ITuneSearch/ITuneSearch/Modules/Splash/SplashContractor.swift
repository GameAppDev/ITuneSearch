//
//  SplashContractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

protocol ISplashPresenterToView: AnyObject { }

protocol ISplashViewToPresenter: AnyObject { }

protocol ISplashPresenterToInteractor: AnyObject { }

protocol ISplashInteractorToPresenter: AnyObject { }

protocol ISplashPresenterToRouter: AnyObject {
    func navigateToRoot()
}

//
//  SplashPresenter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

final class SplashPresenter {
    
    // MARK: Properties
    weak var view: ISplashPresenterToView?
    var interactor: ISplashPresenterToInteractor?
    var router: ISplashPresenterToRouter?
}

extension SplashPresenter: ISplashViewToPresenter {
    
    func viewDidLoad() { }
}

extension SplashPresenter: ISplashInteractorToPresenter { }
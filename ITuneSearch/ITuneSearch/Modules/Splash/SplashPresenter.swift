//
//  SplashPresenter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import ITSUtils

final class SplashPresenter {
    
    // MARK: Properties
    weak var view: ISplashPresenterToView?
    var interactor: ISplashPresenterToInteractor?
    var router: ISplashPresenterToRouter?
    var jailbreakControl: ITSJailbreakProtocol?
}

extension SplashPresenter: ISplashViewToPresenter {
    
    func viewDidAppear() {
        jailbreakControl?.check(canContinue: {
            self.router?.navigateToSearchMain()
        })
    }
}

extension SplashPresenter: ISplashInteractorToPresenter { }

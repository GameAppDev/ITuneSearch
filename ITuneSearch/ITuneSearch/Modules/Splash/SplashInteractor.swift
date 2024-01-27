//
//  SplashInteractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

final class SplashInteractor {
    
    // MARK: Properties
    weak var presenter: ISplashInteractorToPresenter?
}

extension SplashInteractor: ISplashPresenterToInteractor { }

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

extension RootPresenter: IRootViewToPresenter { }

extension RootPresenter: IRootInteractorToPresenter { }

//
//  RootInteractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

final class RootInteractor {
    
    // MARK: Properties
    weak var presenter: IRootInteractorToPresenter?
}

extension RootInteractor: IRootPresenterToInteractor { }

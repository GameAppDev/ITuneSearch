//
//  MoviesSearchContractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

protocol IMoviesSearchPresenterToView: AnyObject { }

protocol IMoviesSearchViewToPresenter: AnyObject { }

protocol IMoviesSearchPresenterToInteractor: AnyObject {
    func fetchSearch()
}

protocol IMoviesSearchInteractorToPresenter: AnyObject {
    func searchFetchedOnSuccess()
    func searchFetchedOnError()
}

protocol IMoviesSearchPresenterToRouter: AnyObject { }

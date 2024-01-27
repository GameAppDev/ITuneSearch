//
//  SearchMainContractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import ITSNetwork

protocol ISearchMainPresenterToView: AnyObject { }

protocol ISearchMainViewToPresenter: AnyObject { }

protocol ISearchMainPresenterToInteractor: AnyObject {
    func fetchSearch(text: String, paginationNumber: Int)
}

protocol ISearchMainInteractorToPresenter: AnyObject {
    func searchFetchedOnSuccess()
    func searchFetchedOnError()
}

protocol ISearchMainPresenterToRouter: AnyObject {
    func navigateToDetail(item: SearchResponseResult)
}

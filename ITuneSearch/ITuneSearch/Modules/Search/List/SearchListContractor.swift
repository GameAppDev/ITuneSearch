//
//  SearchListContractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

protocol ISearchListPresenterToView: AnyObject { }

protocol ISearchListViewToPresenter: AnyObject {
    func viewDidLoad()
}

protocol ISearchListPresenterToInteractor: AnyObject { }

protocol ISearchListInteractorToPresenter: AnyObject { }

protocol ISearchListPresenterToRouter: AnyObject { }

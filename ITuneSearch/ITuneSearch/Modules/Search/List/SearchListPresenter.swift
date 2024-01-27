//
//  SearchListPresenter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

final class SearchListPresenter {
    
    // MARK: Properties
    weak var view: ISearchListPresenterToView?
    var interactor: ISearchListPresenterToInteractor?
    var router: ISearchListPresenterToRouter?
}

extension SearchListPresenter: ISearchListViewToPresenter {
    
    func viewDidLoad() { }
}

extension SearchListPresenter: ISearchListInteractorToPresenter { }

//
//  SearchListInteractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

final class SearchListInteractor {
    
    // MARK: Properties
    weak var presenter: ISearchListInteractorToPresenter?
}

extension SearchListInteractor: ISearchListPresenterToInteractor { }

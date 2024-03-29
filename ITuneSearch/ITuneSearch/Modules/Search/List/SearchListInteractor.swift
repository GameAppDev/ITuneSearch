//
//  SearchListInteractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import ITSNetwork

final class SearchListInteractor {
    
    // MARK: Properties
    weak var presenter: ISearchListInteractorToPresenter?
    
    private var searchList: [SearchResponseResult]?
    
    init(searchList: [SearchResponseResult]?) {
        self.searchList = searchList
    }
}

extension SearchListInteractor: ISearchListPresenterToInteractor {
    
    func setSearchList(_ list: [SearchResponseResult]) {
        searchList = list
    }
    
    func getSearchList() -> [SearchResponseResult]? {
        searchList
    }
    
    func getSearchListCount() -> Int? {
        searchList?.count
    }
}

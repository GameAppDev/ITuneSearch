//
//  SearchDetailInteractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 28.01.2024.
//

import Foundation
import ITSNetwork

final class SearchDetailInteractor {
    
    // MARK: Properties
    weak var presenter: ISearchDetailInteractorToPresenter?
    
    private var listItem: SearchResponseResult?
    
    init(listItem: SearchResponseResult?) {
        self.listItem = listItem
    }
}

extension SearchDetailInteractor: ISearchDetailPresenterToInteractor {
    
    func getListItem() -> SearchResponseResult? {
        listItem
    }
}

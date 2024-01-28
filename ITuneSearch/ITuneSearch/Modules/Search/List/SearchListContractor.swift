//
//  SearchListContractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import ITSNetwork

protocol ISearchListPresenterToView: IPresenterToView {
    func setupCollectionView()
    func reloadCollectionView()
}

protocol ISearchListViewToPresenter: IViewToPresenter { }

protocol ISearchListPresenterToInteractor: IPresenterToInteractor {
    func getSearchList() -> [SearchResponseResult]?
    func getSearchListCount() -> Int?
}

protocol ISearchListInteractorToPresenter: IInteractorToPresenter { }

protocol ISearchListPresenterToRouter: IPresenterToRouter { }

protocol ISearchListAdapterToPresenter: IAdapterToPresenter { }

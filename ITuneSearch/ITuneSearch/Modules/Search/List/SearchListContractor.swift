//
//  SearchListContractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

protocol ISearchListPresenterToView: IPresenterToView {
    func setupCollectionView()
}

protocol ISearchListViewToPresenter: IViewToPresenter { }

protocol ISearchListPresenterToInteractor: IPresenterToInteractor { }

protocol ISearchListInteractorToPresenter: IInteractorToPresenter { }

protocol ISearchListPresenterToRouter: IPresenterToRouter { }

protocol ISearchListAdapterToPresenter: IAdapterToPresenter { }

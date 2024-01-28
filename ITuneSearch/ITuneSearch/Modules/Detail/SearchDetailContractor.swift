//
//  SearchDetailContractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 28.01.2024.
//

import Foundation
import ITSNetwork

protocol ISearchDetailPresenterToView: IPresenterToView { }

protocol ISearchDetailViewToPresenter: IViewToPresenter { }

protocol ISearchDetailPresenterToInteractor: IPresenterToInteractor {
    func getListItem() -> SearchResponseResult?
}

protocol ISearchDetailInteractorToPresenter: IInteractorToPresenter { }

protocol ISearchDetailPresenterToRouter: IPresenterToRouter { }

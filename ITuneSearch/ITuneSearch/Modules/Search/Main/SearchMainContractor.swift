//
//  SearchMainContractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import ITSNetwork

protocol ISearchMainPresenterToView: IPresenterToView {
    func setNavigationBar(title: String?,
                          leftButton: CustomNavigationBar.ButtonType?,
                          rightButton: CustomNavigationBar.ButtonType?)
    func setupPaginationView(dataList: [PaginationModel])
    func setPaginationView(index: Int)
    func setPaginationView(isHidden: Bool)
}

protocol ISearchMainViewToPresenter: IViewToPresenter { }

protocol ISearchMainPresenterToInteractor: IPresenterToInteractor {
    func fetchSearch(text: String, paginationNumber: Int)
    func getPaginationDataList() -> [PaginationModel]
}

protocol ISearchMainInteractorToPresenter: IInteractorToPresenter {
    func searchFetchedOnSuccess()
    func searchFetchedOnError()
}

protocol ISearchMainPresenterToRouter: IPresenterToRouter {
    func navigateToDetail(item: SearchResponseResult)
}

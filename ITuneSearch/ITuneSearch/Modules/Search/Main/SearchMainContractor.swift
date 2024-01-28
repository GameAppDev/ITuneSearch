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
    func setupItemSearchBar()
    func dismissSearchBarKeyboard()
    func setupPaginationView(dataList: [PaginationModel])
    func setPaginationView(index: Int)
    func setPaginationView(isHidden: Bool)
}

protocol ISearchMainViewToPresenter: IViewToPresenter {
    func handleSearchBarSearchClicked(text: String?)
}

protocol ISearchMainPresenterToInteractor: IPresenterToInteractor {
    func fetchSearch(text: String, paginationNumber: Int)
    func getPaginationTypes() -> [SearchResultPaginationType]?
    func removeAllSearchList()
    func appendToSearchList(_ list: [SearchResponseResult])
    func getSearchList(by type: SearchResultPaginationType) -> [SearchResponseResult]
}

protocol ISearchMainInteractorToPresenter: IInteractorToPresenter {
    func searchFetchedOnSuccess(list: [SearchResponseResult]?)
    func searchFetchedOnError(message: String?)
}

protocol ISearchMainPresenterToRouter: IPresenterToRouter {
    func navigateToDetail(listItem: SearchResponseResult)
}

// MARK: Shared
protocol ISearchMainProtocol: AnyObject {
    func handleFetchMore()
    func handleListItemSelection(listItem: SearchResponseResult)
}

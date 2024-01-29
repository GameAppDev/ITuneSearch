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
    func setPaginationView(dataList: [PaginationModel])
    func setPaginationView(index: Int)
    func setPaginationView(isHidden: Bool)
    func clearPaginationViews()
}

protocol ISearchMainViewToPresenter: IViewToPresenter {
    func handleSearchBarSearchClicked(text: String?)
}

protocol ISearchMainPresenterToInteractor: IPresenterToInteractor {
    func fetchSearch(text: String,
                     paginationNumber: Int,
                     isNewSearch: Bool)
    func getPaginationTypes() -> [SearchResultPaginationType]?
    func removeAllSearchList()
    func setSearchList(_ list: [SearchResponseResult])
    func getSearchList(by type: SearchResultPaginationType) -> [SearchResponseResult]
    func setSearchedText(_ text: String)
    func getSearchedText() -> String?
}

protocol ISearchMainInteractorToPresenter: IInteractorToPresenter {
    func searchFetchedOnSuccess(list: [SearchResponseResult]?,
                                isNewSearch: Bool)
    func searchFetchedOnError(message: String?)
}

protocol ISearchMainPresenterToRouter: IPresenterToRouter {
    func navigateToDetail(listItem: SearchResponseResult)
}

// MARK: Shared - Main
protocol ISearchMainProtocol: AnyObject {
    func fetchMoreSearch()
    func handleListItemSelection(listItem: SearchResponseResult)
}

// MARK: Shared - Inner
protocol ISearchInnerProtocol: AnyObject {
    func searchMoreFetchedOnSuccess(list: [SearchResponseResult]?)
}

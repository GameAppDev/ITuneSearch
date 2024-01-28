//
//  SearchMainPresenter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import ITSNetwork
import Reachability
import ITSUtils

final class SearchMainPresenter {
    
    // MARK: Properties
    weak var view: ISearchMainPresenterToView?
    var interactor: ISearchMainPresenterToInteractor?
    var router: ISearchMainPresenterToRouter?
    var networkListener: ITSReachabilityListenerProtocol?
    
    private var paginationNumber: Int = 20
}

extension SearchMainPresenter: ISearchMainViewToPresenter {
    
    func viewDidLoad() {
        setupNetworkListener()
        view?.setupItemSearchBar()
    }
    
    func viewWillAppear() {
        view?.setNavigationBar(
            title: "search".localized,
            leftButton: nil,
            rightButton: nil
        )
    }
    
    func handleSearchBarSearchClicked(text: String?) {
        guard let text, text != "",
              let urlEncodedText = text.toUrlEncodedFormat()
        else { return }
        
        view?.dismissSearchBarKeyboard()
        guard networkListener?.isReachable() ?? false else {
            view?.showPopup(
                identifier: "connection_error_id",
                content: "connection_error".localized
            )
            return
        }
        
        setPaginationNumber(to: 20)
        interactor?.setSearchedText(urlEncodedText)
        interactor?.removeAllSearchList()
        view?.showIndicatorView()
        interactor?.fetchSearch(
            text: urlEncodedText,
            paginationNumber: paginationNumber,
            isNewSearch: true
        )
    }
}

extension SearchMainPresenter: ISearchMainInteractorToPresenter {
    
    func searchFetchedOnSuccess(
        list: [SearchResponseResult]?,
        isNewSearch: Bool
    ) {
        view?.hideIndicatorView()
        
        guard let list, list.isNotEmpty else {
            view?.showPopup(
                identifier: "empty_list_error_id",
                content: "empty_list_error".localized
            )
            return
        }
        
        interactor?.setSearchList(list)
        setupPaginationView()
    }
    
    func searchFetchedOnError(message: String?) {
        view?.hideIndicatorView()
        view?.showPopup(
            identifier: "request_error_id",
            content: message ?? "request_error".localized
        )
    }
}

extension SearchMainPresenter: ISearchMainProtocol {
    
    func fetchMoreSearch() {
        guard let searchedText = interactor?.getSearchedText()
        else { return }
        
        setPaginationNumber(to: paginationNumber + 20)
        view?.showIndicatorView()
        interactor?.fetchSearch(
            text: searchedText,
            paginationNumber: paginationNumber,
            isNewSearch: false
        )
    }
    
    func handleListItemSelection(listItem: SearchResponseResult) {
        router?.navigateToDetail(listItem: listItem)
    }
}

// MARK: Pagination
extension SearchMainPresenter {
    
    private func setupPaginationView() {
        view?.setPaginationView(isHidden: true)
        guard let paginationTypes = interactor?.getPaginationTypes(),
              paginationTypes.isNotEmpty
        else { return }
        
        var paginationList = [PaginationModel]()
        paginationTypes.forEach { type in
            paginationList.append(
                .init(
                    vc: SearchListRouter.returnVC(
                        searchList: interactor?.getSearchList(by: type),
                        mainDelegate: self
                    ),
                    title: type.name
                )
            )
        }
        view?.clearPaginationViews()
        view?.setupPaginationView(dataList: paginationList)
        view?.setPaginationView(index: 0)
        view?.setPaginationView(isHidden: false)
    }
    
    private func setPaginationNumber(to number: Int) {
        paginationNumber = number
    }
}

// MARK: ReachabilityListener
extension SearchMainPresenter {
    
    private func setupNetworkListener() {
        networkListener?.onReachable(onNetworkStatusChange(status:))
    }
    
    private func onNetworkStatusChange(status: Reachability) {
        if networkListener?.isReachable() ?? false,
           status.connection != .unavailable {
            // TODO: Control !isAllRequestsCompleted
        }
    }
}

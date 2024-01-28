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
    
    private var paginationNumberForEachRequest: Int { get { return 20 } }
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
        guard let text, text != ""
        else { return }
        
        view?.dismissSearchBarKeyboard()
        guard networkListener?.isReachable() ?? false else {
            view?.showPopup(
                identifier: "connection_error_id",
                content: "connection_error".localized
            )
            return
        }
        
        interactor?.removeAllSearchList()
        view?.showIndicatorView()
        interactor?.fetchSearch(
            text: text.toUrlEncodedFormat(),
            paginationNumber: paginationNumberForEachRequest
        )
    }
}

extension SearchMainPresenter: ISearchMainInteractorToPresenter {
    
    func searchFetchedOnSuccess(list: [SearchResponseResult]?) {
        view?.hideIndicatorView()
        
        guard let list, list.isNotEmpty else {
            view?.showPopup(
                identifier: "empty_list_error_id",
                content: "empty_list_error".localized
            )
            return
        }
        
        interactor?.appendToSearchList(list)
        handlePaginationView()
        // TODO: Handle Reload PaginationViews
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
    
    func handleListItemSelection(listItem: SearchResponseResult) {
        router?.navigateToDetail(listItem: listItem)
    }
}

extension SearchMainPresenter {
    
    private func handlePaginationView() {
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
        view?.setupPaginationView(dataList: paginationList)
        view?.setPaginationView(index: 0)
        view?.setPaginationView(isHidden: false)
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

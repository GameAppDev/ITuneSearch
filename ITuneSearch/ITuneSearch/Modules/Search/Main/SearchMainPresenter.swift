//
//  SearchMainPresenter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import ITSNetwork
import Reachability

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
        
        if networkListener?.isReachable() ?? false {
            view?.showIndicatorView()
            interactor?.fetchSearch(
                text: "lana+del+rey",
                paginationNumber: paginationNumberForEachRequest
            )
        }
    }
    
    func viewWillAppear() {
        view?.setNavigationBar(
            title: "search".localized,
            leftButton: nil,
            rightButton: nil
        )
    }
}

extension SearchMainPresenter: ISearchMainInteractorToPresenter {
    
    func searchFetchedOnSuccess(list: [SearchResponseResult]?) {
        view?.hideIndicatorView()
        
        guard let list, list.isNotEmpty
        else { return }
        
        interactor?.appendToSearchList(list)
        handlePaginationView()
        // TODO: Handle Reload PaginationViews
    }
    
    func searchFetchedOnError(message: String?) {
        view?.hideIndicatorView()
        view?.showPopup(
            identifier: "error_id",
            content: message ?? "error".localized
        )
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
                        searchList: interactor?.getSearchList(by: type)
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
           status.connection != .unavailable
           /* TODO: !isAllRequestsCompleted */{
            interactor?.fetchSearch(
                text: "harry+potter",
                paginationNumber: paginationNumberForEachRequest
            )
        }
    }
}

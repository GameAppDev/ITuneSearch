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
        
        view?.setPaginationView(isHidden: true)
        guard let dataList = interactor?.getPaginationDataList()
        else { return }
        
        view?.setupPaginationView(dataList: dataList)
        view?.setPaginationView(index: 0)
        view?.setPaginationView(isHidden: false)
        
        if networkListener?.isReachable() ?? false {
            interactor?.fetchSearch(
                text: "harry+potter",
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
    
    func searchFetchedOnSuccess() { }
    
    func searchFetchedOnError() { }
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

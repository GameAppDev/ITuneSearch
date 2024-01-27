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
}

extension SearchMainPresenter: ISearchMainViewToPresenter {
    
    func viewDidLoad() {
        setupNetworkListener()
        //        if networkListener?.isReachable() ?? false {
        //            interactor?.fetchSearch(text: <#T##String#>, paginationNumber: <#T##Int#>)
        //        }
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
           // interactor?.fetchSearch()
        }
    }
}

//
//  MoviesSearchPresenter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import ITSNetwork
import Reachability

final class MoviesSearchPresenter {
    
    // MARK: Properties
    weak var view: IMoviesSearchPresenterToView?
    var interactor: IMoviesSearchPresenterToInteractor?
    var router: IMoviesSearchPresenterToRouter?
    var networkListener: ITSReachabilityListenerProtocol?
}

extension MoviesSearchPresenter: IMoviesSearchViewToPresenter {
    
    func viewDidLoad() {
        setupNetworkListener()
        if networkListener?.isReachable() ?? false {
            interactor?.fetchSearch()
        }
    }
}

extension MoviesSearchPresenter: IMoviesSearchInteractorToPresenter {
    
    func searchFetchedOnSuccess() {
        router?.navigateToRoot()
    }
    
    func searchFetchedOnError() { }
    
    func connectionOnError() { }
}

// MARK: ReachabilityListener
extension MoviesSearchPresenter {
    
    private func setupNetworkListener() {
        networkListener?.onReachable(onNetworkStatusChange(status:))
    }
    
    private func onNetworkStatusChange(status: Reachability) {
        if networkListener?.isReachable() ?? false,
           status.connection != .unavailable
           /* TODO: !isAllRequestsCompleted */{
            interactor?.fetchSearch()
        }
    }
}

//
//  SplashPresenter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import ITSNetwork
import Reachability

final class SplashPresenter {
    
    // MARK: Properties
    weak var view: ISplashPresenterToView?
    var interactor: ISplashPresenterToInteractor?
    var router: ISplashPresenterToRouter?
    var networkListener: ITSReachabilityListenerProtocol?
}

extension SplashPresenter: ISplashViewToPresenter {
    
    func viewDidLoad() {
        setupNetworkListener()
        if networkListener?.isReachable() ?? false {
            interactor?.fetchSearch()
        }
    }
}

extension SplashPresenter: ISplashInteractorToPresenter {
    
    func searchFetchedOnSuccess() {
        router?.navigateToRoot()
    }
    
    func searchFetchedOnError() { }
    
    func connectionOnError() { }
}

// MARK: ReachabilityListener
extension SplashPresenter {
    
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

//
//  SplashInteractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import ITSNetwork
import Moya

final class SplashInteractor {
    
    // MARK: Properties
    weak var presenter: ISplashInteractorToPresenter?
    
    var networkService: ITSNetworkServiceProtocol?
}

extension SplashInteractor: ISplashPresenterToInteractor {
    
    func fetchSearch() {
        networkService?.request(
            endpoint: .search(text: "Starboy", paginationNumber: 20)
        ) { [weak self] (result: Result<SearchResponseModel, MoyaError>) in
            guard let self else { return }
            switch result {
            case .success(let models):
                debugPrint("123123 1- \(models.results?.count)")
                presenter?.searchFetchedOnSuccess()
            case .failure(let error):
                debugPrint("123123 2- \(error.errorDescription)")
                presenter?.searchFetchedOnError()
            }
        }
    }
}

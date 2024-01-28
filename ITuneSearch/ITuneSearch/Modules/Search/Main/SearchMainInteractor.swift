//
//  SearchMainInteractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import ITSNetwork
import Moya

final class SearchMainInteractor {
    
    // MARK: Properties
    weak var presenter: ISearchMainInteractorToPresenter?
    var networkService: ITSNetworkServiceProtocol?
    
    private var searchList = [SearchResponseResult]()
    private var searchedText: String?
}

extension SearchMainInteractor: ISearchMainPresenterToInteractor {
    
    func fetchSearch(
        text: String,
        paginationNumber: Int,
        isNewSearch: Bool
    ) {
        networkService?.request(
            endpoint: .search(text: text, paginationNumber: paginationNumber)
        ) { [weak self] (result: Result<SearchResponseModel, MoyaError>) in
            guard let self else { return }
            switch result {
            case .success(let models):
                presenter?.searchFetchedOnSuccess(
                    list: models.results,
                    isNewSearch: isNewSearch
                )
            case .failure(let error):
                presenter?.searchFetchedOnError(message: error.errorDescription)
            }
        }
    }
    
    func getPaginationTypes() -> [SearchResultPaginationType]? {
        return searchList.compactMap({ $0.paginationType }).uniqued()
    }
    
    func removeAllSearchList() {
        searchList.removeAll()
    }
    
    func setSearchList(_ list: [SearchResponseResult]) {
        searchList = list
    }
    
    func getSearchList(by type: SearchResultPaginationType) -> [SearchResponseResult] {
        return searchList.filter({ $0.paginationType == type })
    }
    
    func setSearchedText(_ text: String) {
        searchedText = text
    }
    
    func getSearchedText() -> String? {
        searchedText
    }
}

//
//  SearchMainContractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import ITSNetwork

protocol ISearchMainPresenterToView: AnyObject {
    func setupPaginationView(dataList: [PaginationModel])
    func setPaginationView(index: Int)
    func setPaginationView(isHidden: Bool)
}

protocol ISearchMainViewToPresenter: AnyObject {
    func viewDidLoad()
}

protocol ISearchMainPresenterToInteractor: AnyObject {
    func fetchSearch(text: String, paginationNumber: Int)
    func getPaginationDataList() -> [PaginationModel]
}

protocol ISearchMainInteractorToPresenter: AnyObject {
    func searchFetchedOnSuccess()
    func searchFetchedOnError()
}

protocol ISearchMainPresenterToRouter: AnyObject {
    func navigateToDetail(item: SearchResponseResult)
}

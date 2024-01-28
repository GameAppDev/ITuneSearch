//
//  SearchListPresenter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import ITSUtils

final class SearchListPresenter {
    
    // MARK: Properties
    weak var view: ISearchListPresenterToView?
    var interactor: ISearchListPresenterToInteractor?
    var router: ISearchListPresenterToRouter?
    var imageService: ITSImageServiceProtocol?
}

extension SearchListPresenter: ISearchListViewToPresenter {
    
    func viewDidLoad() {
        view?.setupCollectionView()
    }
}

extension SearchListPresenter: ISearchListInteractorToPresenter { }

extension SearchListPresenter: ISearchListAdapterToPresenter {
    
    func rowsCount() -> Int? {
        interactor?.getSearchListCount()
    }
    
    func getList() -> [Any]? {
        interactor?.getSearchList()
    }
    
    func listItemSelected(index: Int) { }
    
    func getImageServiceProtocol() -> ITSImageServiceProtocol? {
        imageService
    }
}

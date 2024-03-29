//
//  SearchListPresenter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import ITSUtils
import ITSNetwork

final class SearchListPresenter {
    
    // MARK: Properties
    weak var view: ISearchListPresenterToView?
    var interactor: ISearchListPresenterToInteractor?
    var router: ISearchListPresenterToRouter?
    var imageService: ITSImageServiceProtocol?
    var mainDelegate: ISearchMainProtocol?
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
    
    func getListItem(index: Int) -> Any? {
        interactor?.getSearchList()?[safe: index]
    }
    
    func listItemSelected(index: Int) {
        guard let searchList = interactor?.getSearchList(),
              let listItem = searchList[safe: index]
        else { return }
        
        mainDelegate?.handleListItemSelection(
            listItem: listItem
        )
    }
    
    func getImageServiceProtocol() -> ITSImageServiceProtocol? {
        imageService
    }
    
    func handleCollectionViewDisplayed(currentIndex: Int) {
        if let listCount = interactor?.getSearchListCount(),
           currentIndex == (listCount - 1) {
            mainDelegate?.fetchMoreSearch()
        }
    }
}

extension SearchListPresenter: ISearchInnerProtocol {
    
    func searchMoreFetchedOnSuccess(list: [SearchResponseResult]?) {
        guard let list, list.isNotEmpty
        else { return }
        
        interactor?.setSearchList(list)
        view?.reloadCollectionView()
    }
}

//
//  SearchListPresenter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

final class SearchListPresenter {
    
    // MARK: Properties
    weak var view: ISearchListPresenterToView?
    var interactor: ISearchListPresenterToInteractor?
    var router: ISearchListPresenterToRouter?
}

extension SearchListPresenter: ISearchListViewToPresenter {
    
    func viewDidLoad() {
        view?.setupCollectionView()
    }
    
    func viewWillAppear() {
        view?.setNavigationBar(
            title: "asdada",
            leftButton: nil,
            rightButton: nil
        )
    }
}

extension SearchListPresenter: ISearchListInteractorToPresenter { }

extension SearchListPresenter: ISearchListAdapterToPresenter {
    
    func rowsCount() -> Int? { return nil }
    
    func getList() -> [Any]? { return nil}
    
    func listItemSelected(index: Int) { }
}
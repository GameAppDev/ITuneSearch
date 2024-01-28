//
//  SearchDetailPresenter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 28.01.2024.
//

import Foundation
import ITSUtils

final class SearchDetailPresenter {
    
    // MARK: Properties
    weak var view: ISearchDetailPresenterToView?
    var interactor: ISearchDetailPresenterToInteractor?
    var router: ISearchDetailPresenterToRouter?
    var imageService: ITSImageServiceProtocol?
}

extension SearchDetailPresenter: ISearchDetailViewToPresenter {
    
    func viewDidLoad() { }
}

extension SearchDetailPresenter: ISearchDetailInteractorToPresenter { }

//
//  SearchMainRouter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit
import ITSNetwork

final class SearchMainRouter {
    
    // MARK: Properties
    weak var view: UIViewController?
    
    // MARK: Static Method
    static func returnVC() -> UIViewController {
        SearchMainBuilder.buildModule()
    }
}

extension SearchMainRouter: ISearchMainPresenterToRouter {
    
    func navigateToDetail(listItem: SearchResponseResult) {
        view?.navigationController?.push(
            SearchDetailRouter.returnVC(listItem: listItem)
        )
    }
}

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
        return SearchMainBuilder.buildModule()
    }
}

extension SearchMainRouter: ISearchMainPresenterToRouter {
    
    func navigateToDetail(item: SearchResponseResult) {
        // TODO: Handle
    }
}

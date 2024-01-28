//
//  SearchListRouter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit
import ITSNetwork

final class SearchListRouter {
    
    // MARK: Properties
    weak var view: UIViewController?
    
    // MARK: Static Method
    static func returnVC(
        searchList: [SearchResponseResult]?
    ) -> UIViewController {
        return SearchListBuilder.buildModule(searchList: searchList)
    }
}

extension SearchListRouter: ISearchListPresenterToRouter { }

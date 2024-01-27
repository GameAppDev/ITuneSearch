//
//  SearchListRouter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

final class SearchListRouter {
    
    // MARK: Properties
    weak var view: UIViewController?
    
    // MARK: Static Method
    static func returnVC() -> UIViewController {
        return SearchListBuilder.buildModule()
    }
}

extension SearchListRouter: ISearchListPresenterToRouter { }

//
//  SearchDetailRouter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 28.01.2024.
//

import UIKit
import ITSNetwork

final class SearchDetailRouter {
    
    // MARK: Properties
    weak var view: UIViewController?
    
    // MARK: Static Method
    static func returnVC(
        listItem: SearchResponseResult?
    ) -> UIViewController {
        SearchDetailBuilder.buildModule(listItem: listItem)
    }
}

extension SearchDetailRouter: ISearchDetailPresenterToRouter { }

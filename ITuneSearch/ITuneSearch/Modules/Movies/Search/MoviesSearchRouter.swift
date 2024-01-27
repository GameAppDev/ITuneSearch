//
//  MoviesSearchRouter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

final class MoviesSearchRouter {
    
    // MARK: Properties
    weak var view: UIViewController?
    
    // MARK: Static Method
    static func returnVC() -> UIViewController {
        return MoviesSearchBuilder.buildModule()
    }
}

extension MoviesSearchRouter: IMoviesSearchPresenterToRouter { }

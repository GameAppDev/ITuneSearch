//
//  MoviesSearchViewController.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

final class MoviesSearchViewController: UIViewController {

    // MARK: Properties
    var presenter: IMoviesSearchViewToPresenter?
}

extension MoviesSearchViewController: IMoviesSearchPresenterToView { }

// MARK: Lifecycle
extension MoviesSearchViewController { }

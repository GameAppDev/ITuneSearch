//
//  SearchMainViewController.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

final class SearchMainViewController: UIViewController {

    // MARK: Properties
    var presenter: ISearchMainViewToPresenter?
}

extension SearchMainViewController: ISearchMainPresenterToView { }

// MARK: Lifecycle
extension SearchMainViewController { }

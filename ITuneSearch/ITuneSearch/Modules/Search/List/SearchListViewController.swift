//
//  SearchListViewController.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

final class SearchListViewController: UIViewController {
    
    // MARK: Properties
    var presenter: ISearchListViewToPresenter?
}

extension SearchListViewController: ISearchListPresenterToView { }

// MARK: Lifecycle
extension SearchListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

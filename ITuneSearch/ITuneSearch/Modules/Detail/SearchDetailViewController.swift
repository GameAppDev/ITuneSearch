//
//  SearchDetailViewController.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 28.01.2024.
//

import UIKit

final class SearchDetailViewController: UIViewController {
    
    // MARK: Properties
    var presenter: ISearchDetailViewToPresenter?
}

extension SearchDetailViewController: ISearchDetailPresenterToView { }

// MARK: Lifecycle
extension SearchDetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad?()
    }
}

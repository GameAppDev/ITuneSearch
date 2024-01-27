//
//  SearchMainViewController.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

final class SearchMainViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet private weak var itemPaginationView: PaginationView!
    
    // MARK: Properties
    var presenter: ISearchMainViewToPresenter?
}

extension SearchMainViewController: ISearchMainPresenterToView {
    
    func setupPaginationView(dataList: [PaginationModel]) {
        itemPaginationView.dataList = dataList
    }
    
    func setPaginationView(index: Int) {
        itemPaginationView.selectedIndex = index
    }
    
    func setPaginationView(isHidden: Bool) {
        itemPaginationView.isHidden = isHidden
    }
}

// MARK: Lifecycle
extension SearchMainViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad?()
    }
}

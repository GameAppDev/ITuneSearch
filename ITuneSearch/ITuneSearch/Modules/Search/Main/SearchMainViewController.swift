//
//  SearchMainViewController.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

final class SearchMainViewController: BaseViewController {

    // MARK: Outlets
    @IBOutlet private weak var itemPaginationView: PaginationView!
    
    // MARK: Properties
    var presenter: ISearchMainViewToPresenter?
}

extension SearchMainViewController: ISearchMainPresenterToView {
    
    func setNavigationBar(
        title: String?,
        leftButton: CustomNavigationBar.ButtonType?,
        rightButton: CustomNavigationBar.ButtonType?
    ) {
        setNavigationBarItems(
            title: title,
            leftButton: leftButton,
            rightButton: rightButton
        )
    }
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear?()
    }
}

//
//  SearchListViewController.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit
import ITSUtils

final class SearchListViewController: BaseViewController {
    
    // MARK: Outlets
    @IBOutlet private weak var listCollectionView: UICollectionView!
    
    // MARK: Properties
    var presenter: ISearchListViewToPresenter?
    var collectionViewAdapter: SearchListCollectionViewAdapter?
}

extension SearchListViewController: ISearchListPresenterToView {
    
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
    
    func setupCollectionView() {
        listCollectionView.dataSource = collectionViewAdapter
        listCollectionView.delegate = collectionViewAdapter
        listCollectionView.registerCell(ListCollectionViewCell.self)
    }
}

// MARK: Lifecycle
extension SearchListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad?()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear?()
    }
}

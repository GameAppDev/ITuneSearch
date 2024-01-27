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
}

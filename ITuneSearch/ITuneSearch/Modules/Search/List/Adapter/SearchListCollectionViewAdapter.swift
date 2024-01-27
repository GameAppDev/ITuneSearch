//
//  SearchListCollectionViewAdapter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

final class SearchListCollectionViewAdapter: NSObject {

    // MARK: Properties
    var presenter: ISearchListAdapterToPresenter?
}

extension SearchListCollectionViewAdapter: UICollectionViewDataSource {
    
    // MARK: Count
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return presenter?.sectionCount() ?? 1
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return presenter?.rowsCount() ?? 0
    }
    
    // MARK: Cell
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeue(cell: ListCollectionViewCell.self, indexPath: indexPath)
        else { return UICollectionViewCell() }
        
        guard let adoptionList = presenter?.getList() as? [AdoptionModel],
              let adoptionListItem = adoptionList[safe: indexPath.row]
        else { return UICollectionViewCell() }
        
        cell.configureCell(with: adoptionListItem)
        
        return cell
    }
}

extension SearchListCollectionViewAdapter: UICollectionViewDelegate {
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        presenter?.listItemSelected(index: indexPath.row)
    }
}

extension SearchListCollectionViewAdapter: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = UIScreen.main.bounds.width / 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return .zero
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return .zero
    }
}

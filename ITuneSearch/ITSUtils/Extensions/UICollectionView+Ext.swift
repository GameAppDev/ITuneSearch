//
//  UICollectionView+Ext.swift
//  ITSUtils
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

extension UICollectionView {

    // MARK: Register
    public func registerCell<T: UICollectionReusableView>(_ cell: T.Type) {
        register(
            nibFromClass(cell),
            forCellWithReuseIdentifier: cell.className
        )
    }
    
    public func registerHeaderView<T: UICollectionReusableView>(_ view: T.Type) {
        register(
            nibFromClass(view),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: view.className
        )
    }
    
    public func registerFooterView<T: UICollectionReusableView>(_ view: T.Type) {
        register(
            nibFromClass(view),
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: view.className
        )
    }
    
    // MARK: Dequeue
    public func dequeue<T: UICollectionReusableView>(
        cell: T.Type,
        indexPath: IndexPath
    ) -> T? {
        dequeueReusableCell(
            withReuseIdentifier: T.className,
            for: indexPath
        ) as? T
    }

    public func dequeue<T: UICollectionReusableView>(
        header: T.Type,
        indexPath: IndexPath
    ) -> T? {
        dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: T.className,
            for: indexPath
        ) as? T
    }

    public func dequeue<T: UICollectionReusableView>(
        footer: T.Type,
        indexPath: IndexPath
    ) -> T? {
        dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: T.className,
            for: indexPath
        ) as? T
    }
    
    fileprivate func nibFromClass(_ type: UICollectionReusableView.Type) -> UINib {
        return UINib(nibName: type.className, bundle: nil)
    }
}

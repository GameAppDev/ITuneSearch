//
//  SearchListBuilder.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

struct SearchListBuilder {

    static func buildModule() -> UIViewController {
        let router = SearchListRouter()
        let viewController = SearchListViewController()
        let presenter = SearchListPresenter()
        let interactor = SearchListInteractor()
        let collectionViewAdapter = SearchListCollectionViewAdapter()
        
        router.view = viewController
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.presenter = presenter
        viewController.collectionViewAdapter = collectionViewAdapter
        
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        collectionViewAdapter.presenter = presenter
        
        return viewController
    }
}

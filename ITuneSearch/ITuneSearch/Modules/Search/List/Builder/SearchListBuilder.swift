//
//  SearchListBuilder.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit
import ITSNetwork

struct SearchListBuilder {

    static func buildModule(
        searchList: [SearchResponseResult]?
    ) -> UIViewController {
        let router = SearchListRouter()
        let viewController = SearchListViewController()
        let presenter = SearchListPresenter()
        let interactor = SearchListInteractor(searchList: searchList)
        let collectionViewAdapter = SearchListCollectionViewAdapter()
        let imageService = ITSDependencyContainer.getDefaultImageService()
        
        router.view = viewController
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.presenter = presenter
        viewController.collectionViewAdapter = collectionViewAdapter
        
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.imageService = imageService
        
        interactor.presenter = presenter
        
        collectionViewAdapter.presenter = presenter
        
        return viewController
    }
}

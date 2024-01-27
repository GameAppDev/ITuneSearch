//
//  SearchMainBuilder.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

struct SearchMainBuilder {

    static func buildModule() -> UIViewController {
        let router = SearchMainRouter()
        let viewController = SearchMainViewController()
        let presenter = SearchMainPresenter()
        let interactor = SearchMainInteractor()
        let networkListener = ITSDependencyContainer.getDefaultNetworkListener()
        let networkService = ITSDependencyContainer.getDefaultNetworkService()
        
        router.view = viewController
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.presenter = presenter
        
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.networkListener = networkListener
        
        interactor.presenter = presenter
        interactor.networkService = networkService
        
        return viewController
    }
}

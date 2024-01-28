//
//  SearchDetailBuilder.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 28.01.2024.
//

import UIKit
import ITSNetwork

struct SearchDetailBuilder {

    static func buildModule(listItem: SearchResponseResult?) -> UIViewController {
        let router = SearchDetailRouter()
        let viewController = SearchDetailViewController()
        let presenter = SearchDetailPresenter()
        let interactor = SearchDetailInteractor(listItem: listItem)
        let imageService = ITSDependencyContainer.getDefaultImageService()
        
        router.view = viewController
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.presenter = presenter
        
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.imageService = imageService
        
        interactor.presenter = presenter
        
        return viewController
    }
}

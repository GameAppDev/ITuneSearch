//
//  RootBuilder.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

struct RootBuilder {

    static func buildModule() -> UIViewController {
        let router = RootRouter()
        let viewController = RootViewController()
        let presenter = RootPresenter()
        let interactor = RootInteractor()
        
        router.view = viewController
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.presenter = presenter
        
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return viewController
    }
}

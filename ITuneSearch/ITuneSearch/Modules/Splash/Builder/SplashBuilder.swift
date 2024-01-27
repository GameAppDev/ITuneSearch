//
//  SplashBuilder.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

struct SplashBuilder {

    static func buildModule() -> UIViewController {
        let router = SplashRouter()
        let viewController = SplashViewController()
        let presenter = SplashPresenter()
        let interactor = SplashInteractor()
        let jailbreakControl = ITSDependencyContainer.getDefaultJailbreakControl()
        
        router.view = viewController
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.presenter = presenter
        
        presenter.router = router
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.jailbreakControl = jailbreakControl
        
        interactor.presenter = presenter
        
        return viewController
    }
}

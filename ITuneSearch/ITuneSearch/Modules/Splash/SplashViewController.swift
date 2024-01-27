//
//  SplashViewController.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

final class SplashViewController: UIViewController {
    
    // MARK: Properties
    var presenter: ISplashViewToPresenter?
}

extension SplashViewController: ISplashPresenterToView { }

// MARK: Lifecycle
extension SplashViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter?.viewDidAppear()
    }
}

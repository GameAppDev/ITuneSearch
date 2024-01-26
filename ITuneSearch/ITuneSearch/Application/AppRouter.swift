//
//  AppRouter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

open class AppRouter {
    
    static let shared = AppRouter()
    
    // MARK: Properties
    private var navigationController: UINavigationController?
    
    private static var window: UIWindow? {
        return UIApplication.shared.delegate?.window ?? UIWindow(frame: UIScreen.main.bounds)
    }
    
    // MARK: Methods
    func openApp() {
        setActiveNavigationController(
            with: UIViewController()//SplashRouter.returnVC()
        )
    }
    
    @discardableResult
    func handleUrl(_ url: URL) -> Bool {
        // TODO: Handle Url
        debugPrint("<--- url: \(url) --->")
        return true
    }
}

extension AppRouter {
    
    private func setActiveNavigationController(with rootVC: UIViewController) {
        let navController = UINavigationController(rootViewController: rootVC)
        
        navigationController?.popToRootViewController(animated: false)
        navigationController = nil
        
        navigationController = navController
        
        AppRouter.window?.rootViewController = navController
        AppRouter.window?.makeKeyAndVisible()
    }
}

//
//  ActivityIndicatorManager.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 29.01.2024.
//

import UIKit

protocol IActivityIndicatorManager: AnyObject {
    func showIndicatorView()
    func hideIndicatorView()
}

final class ActivityIndicatorManager {
    
    static let shared = ActivityIndicatorManager()
    
    // MARK: Init
    private init() { }
    
    // MARK: Properties
    private var isShowing: Bool = false
    private var indicatorView: ActivityIndicator?
    private var animationDuration: Double { get { 0.3 } }
    
    // MARK: Methods
    func showIndicator() {
        showIndicatorView()
    }

    func hideIndicator() {
        hideIndicatorView()
    }
}

extension ActivityIndicatorManager: IActivityIndicatorManager {
    
    func showIndicatorView() {
        guard !isShowing else { return }
        
        guard let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first
        else { return }
        
        guard let indicatorView = ActivityIndicator.instanceFromNib() as? ActivityIndicator
        else { return }
        
        indicatorView.setFrame(window)
        
        window.addSubview(indicatorView)
        self.indicatorView = indicatorView
        
        UIView.animate(withDuration: animationDuration) { [weak self] in
            guard let self else { return }
            self.indicatorView?.alpha = 1.0
        }
        
        isShowing = true
    }

    func hideIndicatorView() {
        guard isShowing else { return }
        
        guard let indicatorView else { return }
        
        indicatorView.alpha = 0.0
        UIView.animate(withDuration: animationDuration,
                       delay: 0.0,
                       options: [],
                       animations: {
            indicatorView.alpha = 0.0
        }, completion: { (_: Bool) in
            indicatorView.removeFromSuperview()
        })
        
        isShowing = false
    }
}

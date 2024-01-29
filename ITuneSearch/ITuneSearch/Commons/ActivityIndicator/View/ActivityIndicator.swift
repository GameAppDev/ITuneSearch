//
//  ActivityIndicator.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit
import Lottie

@IBDesignable
final class ActivityIndicator: UIView {
    
    // MARK: Outlet
    @IBOutlet private weak var indicatorAnimationView: LottieAnimationView!
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: Methods
    class func instanceFromNib() -> UIView {
        guard let view = UINib(nibName: String(describing: Self.self),
                               bundle: nil).instantiate(withOwner: nil,
                                                        options: nil)[safe: 0] as? UIView
        else { return UIView() }
        
        return view
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)

        setDefaultLoading()
    }

    func setFrame(_ window: UIWindow) {
        frame = window.frame
        bounds = window.bounds
        layoutIfNeeded()
    }

    private func setDefaultLoading() {
        indicatorAnimationView.backgroundBehavior = .pauseAndRestore
        indicatorAnimationView.loopMode = .loop
        indicatorAnimationView.animation = LottieAnimation.named("indicator-animation-view")
        // TODO: Handle LottieAnimation
        indicatorAnimationView.play()
    }
}

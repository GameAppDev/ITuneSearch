//
//  PaginationView.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit
import Parchment

@IBDesignable
final class PaginationView: UIView {
    
    private var pagingViewController: PagingViewController?
    
    var isSegmentHidden: Bool = false {
        didSet {
            pagingViewController?.menuItemSize = isSegmentHidden
                ? .fixed(width: 0, height: 0)
                : .selfSizing(estimatedWidth: 50, height: 50)
            pagingViewController?.pageViewController.scrollView.isScrollEnabled = !isSegmentHidden
        }
    }
    
    var selectedIndex: Int = 0 {
        didSet {
            DispatchQueue.main.async {
                self.pagingViewController?.select(index: self.selectedIndex)
            }
        }
    }
    
    var dataList: [PaginationModel] = [] {
        didSet {
            var options = PagingOptions()
            options.menuBackgroundColor = .paginationBGColour
            options.menuPosition = .top
            options.menuInteraction = .scrolling
            options.menuItemSize = .selfSizing(estimatedWidth: 50, height: 40)
            options.font = .paginationTextFont ?? .systemFont(ofSize: .init(16))
            options.textColor = .paginationTextColour.withAlphaComponent(0.6)
            options.selectedFont = .paginationTextFont ?? .systemFont(ofSize: .init(16))
            options.selectedTextColor = .paginationTextColour
            options.borderOptions = .hidden
            options.selectedScrollPosition = .preferCentered
            options.indicatorOptions = .hidden
            
            let pagingViewController = PagingViewController(
                options: options,
                viewControllers: dataList.map({ $0.vc })
            )
            pagingViewController.dataSource = self
            pagingViewController.delegate = self
            
            findViewController()?.addChild(pagingViewController)
            addSubview(pagingViewController.view)
            pagingViewController.didMove(toParent: findViewController())
            pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
              pagingViewController.view.leadingAnchor.constraint(equalTo: leadingAnchor),
              pagingViewController.view.trailingAnchor.constraint(equalTo: trailingAnchor),
              pagingViewController.view.bottomAnchor.constraint(equalTo: bottomAnchor),
              pagingViewController.view.topAnchor.constraint(equalTo: topAnchor)
            ])
            
            self.pagingViewController = pagingViewController
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension PaginationView: PagingViewControllerDataSource {
    
    func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
        dataList.count
    }
    
    func pagingViewController(
        _ pagingViewController: PagingViewController,
        viewControllerAt index: Int
    ) -> UIViewController {
        dataList[safe: index]?.vc ?? UIViewController()
    }
    
    func pagingViewController(
        _: PagingViewController,
        pagingItemAt index: Int
    ) -> PagingItem {
        PagingIndexItem(
            index: index,
            title: dataList[safe: index]?.title ?? ""
        )
    }
}

extension PaginationView: PagingViewControllerDelegate {
    
    func pagingViewController(
        _ pagingViewController: PagingViewController,
        didScrollToItem pagingItem: PagingItem,
        startingViewController: UIViewController?,
        destinationViewController: UIViewController,
        transitionSuccessful: Bool
    ) {
        guard let item = pagingItem as? PagingIndexItem else { return }
        debugPrint("<--- PagingViewController Scrolled \(item.title) --->")
    }
}

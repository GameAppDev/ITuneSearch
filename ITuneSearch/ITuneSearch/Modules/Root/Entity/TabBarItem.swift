//
//  TabBarItem.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

enum TabBarItem: CaseIterable {

    case movies
    case music
    case apps
    case books
    
    var index: Int {
        switch self {
        case .movies: return 0
        case .music: return 1
        case .apps: return 2
        case .books: return 3
        }
    }

    var title: String {
        switch self {
        case .movies: return "Movies"
        case .music: return "Music"
        case .apps: return "Apps"
        case .books: return "Books"
        }
    }

    var image: UIImage? {
        switch self {
        case .movies:
            return .init(
                systemName: "movieclapper",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: .init(20),
                                                               weight: .bold,
                                                               scale: .large)
            )
        case .music: return "Music"
        case .apps: return "Apps"
        case .books: return "Books"
        }
    }

    var isEnabled: Bool {
        switch self {
        case .foods: return true
        case .recipes: return true
        }
    }

    var controller: UIViewController {
        switch self {
        case .foods:
            return SearchWithNameRouter.returnVC()
        case .recipes:
            return SearchWithNameRouter.returnVC()
        }
    }
}

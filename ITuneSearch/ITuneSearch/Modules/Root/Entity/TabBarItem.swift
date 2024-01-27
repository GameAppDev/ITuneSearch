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
                withConfiguration: UIImage.SymbolConfiguration(
                    pointSize: .init(14),
                    weight: .medium,
                    scale: .large
                )
            )
        case .music: 
            return .init(
                systemName: "music.note.tv",
                withConfiguration: UIImage.SymbolConfiguration(
                    pointSize: .init(14),
                    weight: .medium,
                    scale: .large
                )
            )
        case .apps:
            return .init(
                systemName: "apps.ipad",
                withConfiguration: UIImage.SymbolConfiguration(
                    pointSize: .init(14),
                    weight: .medium,
                    scale: .large
                )
            )
        case .books:
            return .init(
                systemName: "book",
                withConfiguration: UIImage.SymbolConfiguration(
                    pointSize: .init(14),
                    weight: .medium,
                    scale: .large
                )
            )
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .movies:
            return .init(
                systemName: "movieclapper.fill",
                withConfiguration: UIImage.SymbolConfiguration(
                    pointSize: .init(14),
                    weight: .bold,
                    scale: .large
                )
            )
        case .music:
            return .init(
                systemName: "music.note.tv.fill",
                withConfiguration: UIImage.SymbolConfiguration(
                    pointSize: .init(14),
                    weight: .bold,
                    scale: .large
                )
            )
        case .apps:
            return .init(
                systemName: "apps.ipad.landscape",
                withConfiguration: UIImage.SymbolConfiguration(
                    pointSize: .init(14),
                    weight: .bold,
                    scale: .large
                )
            )
        case .books:
            return .init(
                systemName: "book.fill",
                withConfiguration: UIImage.SymbolConfiguration(
                    pointSize: .init(14),
                    weight: .bold,
                    scale: .large
                )
            )
        }
    }

    var isEnabled: Bool {
        switch self {
        default: return true
        }
    }

    var controller: UIViewController {
        switch self {
        case .movies:
            return UIViewController()
        case .music:
            return UIViewController()
        case .apps:
            return UIViewController()
        case .books:
            return UIViewController()
        }
    }
}

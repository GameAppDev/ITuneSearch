//
//  NavigationBarProtocol.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

protocol ICustomNavigationBar: AnyObject {
    func handleNavigationBarButton(type: CustomNavigationBar.ButtonType)
}

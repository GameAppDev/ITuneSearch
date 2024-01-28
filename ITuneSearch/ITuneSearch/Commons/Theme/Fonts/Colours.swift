//
//  Colours.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 28.01.2024.
//

import UIKit

extension UIColor {
    
    // MARK: NavigationBar
    static let navbarBGColour    = UIColor.secondaryColour
    static let navbarItemsColour = UIColor.primaryColour
    
    // MARK: Shadow
    static let shadowColour = UIColor.secondaryColour
    
    // MARK: BaseVC
    static let baseViewBGColour = UIColor.primaryColour
    
    // MARK: Buttons
    static let primaryButtonBGColour       = UIColor.primaryColour
    static let primaryButtonBorderColour   = UIColor.secondaryColour
    static let primaryButtonTitleColour    = UIColor.secondaryColour
    static let secondaryButtonBGColour     = UIColor.secondaryColour
    static let secondaryButtonBorderColour = UIColor.primaryColour
    static let secondaryButtonTitleColour  = UIColor.primaryColour
    
    // MARK: MenuListItem
    static let menuListItemEnabledBGColour        = UIColor.secondaryColour
    static let menuListItemEnabledBorderColour    = UIColor.primaryColour
    static let menuListItemEnabledTextColour      = UIColor.primaryColour
    static let menuListItemNotEnabledBGColour     = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)
    static let menuListItemNotEnabledBorderColour = UIColor.clear
    static let menuListItemNotEnabledTextColour   = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
}

extension UIColor {
    
    private static let primaryColour   = UIColor(red: 0/255, green: 130/255, blue: 130/255, alpha: 1)
    private static let secondaryColour = UIColor(red: 220/255, green: 230/255, blue: 240/255, alpha: 1)
}

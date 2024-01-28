//
//  Colours.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 28.01.2024.
//

import UIKit

extension UIColor {
    
    // MARK: NavigationBar
    static let navbarBGColour    = UIColor.primaryColour
    static let navbarItemsColour = UIColor.secondaryColour
    
    // MARK: Shadow
    static let shadowColour = UIColor.primaryColour
    
    // MARK: BaseVC
    static let baseViewBGColour = UIColor.secondaryColour
    
    // MARK: Pagination
    static let paginationBGColour   = UIColor.primaryColour
    static let paginationTextColour = UIColor.secondaryColour
    
    // MARK: MenuListItem
    static let listItemBGColour   = UIColor.secondaryColour
    static let listItemTextColour = UIColor.primaryColour
    
    // MARK: Buttons
    static let primaryButtonBGColour       = UIColor.primaryColour
    static let primaryButtonBorderColour   = UIColor.secondaryColour
    static let primaryButtonTitleColour    = UIColor.secondaryColour
    static let secondaryButtonBGColour     = UIColor.secondaryColour
    static let secondaryButtonBorderColour = UIColor.primaryColour
    static let secondaryButtonTitleColour  = UIColor.primaryColour
}

extension UIColor {
    
    private static let primaryColour   = UIColor(red: 0/255, green: 100/255, blue: 100/255, alpha: 1)
    private static let secondaryColour = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
}

//
//  ITSJailbreak.swift
//  ITSUtils
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

public class ITSJailbreak: ITSJailbreakProtocol {

    public init() { }
    
    public func check(canContinue: @escaping () -> Void) {
        canContinue()
    }
}

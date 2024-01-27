//
//  ITSJailbreakProtocol.swift
//  ITSUtils
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

public protocol ITSJailbreakProtocol {

    func check(canContinue: @escaping () -> Void)
}

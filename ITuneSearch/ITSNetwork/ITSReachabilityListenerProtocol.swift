//
//  ITSReachabilityListenerProtocol.swift
//  ITSNetwork
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import Reachability

public protocol ITSReachabilityListenerProtocol {

    func isReachable() -> Bool
    func onReachable(_ callback: @escaping ((_ reachability: Reachability) -> Void))
}

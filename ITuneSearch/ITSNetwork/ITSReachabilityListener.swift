//
//  ITSReachabilityListener.swift
//  ITSNetwork
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import Reachability

public class ITSReachabilityListener: ITSReachabilityListenerProtocol {
    
    var reachability: Reachability?

    public init() {
        do {
            self.reachability = try Reachability()
            try self.reachability?.startNotifier()
        } catch {
            debugPrint("<--- Cannot initialize network reachability listener. --->")
        }
    }

    public func isReachable() -> Bool {
        return self.reachability?.connection != .unavailable
    }

    public func onReachable(_ callback: @escaping ((_ reachability: Reachability) -> Void)) {
        self.reachability?.whenReachable = callback
    }
}

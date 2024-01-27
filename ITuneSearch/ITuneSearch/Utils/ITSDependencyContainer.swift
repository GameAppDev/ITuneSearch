//
//  ITSDependencyContainer.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import ITSNetwork
import Swinject
import Moya

public class ITSDependencyContainer {

    private let container = Container()

    public static let shared = ITSDependencyContainer()

    init() {
        container.register(ITSNetworkServiceProtocol.self) { _ in
            ITSNetworkService(
                plugins: [
                    NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
                ]
            )
        }.inObjectScope(.container)

        container.register(ITSReachabilityListenerProtocol.self) { _ in
            ITSReachabilityListener()
        }.inObjectScope(.container)
    }
    
    public static func getDefaultNetworkService() -> ITSNetworkServiceProtocol {
        return shared.container.resolve(ITSNetworkServiceProtocol.self)!
    }
    
    public static func getDefaultNetworkListener() -> ITSReachabilityListenerProtocol {
        return shared.container.resolve(ITSReachabilityListenerProtocol.self)!
    }
}

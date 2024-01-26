//
//  ITSNetworkServiceProtocol.swift
//  ITSNetwork
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import Moya

public protocol ITSNetworkServiceProtocol {
    
    @discardableResult
    func request(
        endpoint: INNetworkEndpointGroup,
        completion: @escaping ((Result<Moya.Response, MoyaError>) -> Void)
    ) -> Cancellable

    @discardableResult
    func request<T: Codable>(
        endpoint: INNetworkEndpointGroup,
        completion: @escaping ((Result<T, MoyaError>) -> Void)
    ) -> Cancellable
}

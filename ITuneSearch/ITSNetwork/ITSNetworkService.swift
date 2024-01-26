//
//  ITSNetworkService.swift
//  ITSNetwork
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import Moya

public class ITSNetworkService: ITSNetworkServiceProtocol {
    
    let moyaProvider: MoyaProvider<ITSNetworkEndpointGroup>

    public init(plugins: [PluginType]) {
        self.moyaProvider = MoyaProvider<ITSNetworkEndpointGroup>(plugins: plugins)
    }

    @discardableResult
    public func request(
        endpoint: ITSNetworkEndpointGroup,
        completion: @escaping ((Result<Moya.Response, MoyaError>) -> Void)
    ) -> Cancellable {
        return moyaProvider.request(endpoint) { result in
            completion(result)
        }
    }

    @discardableResult
    public func request<T: Codable>(
        endpoint: ITSNetworkEndpointGroup,
        completion: @escaping ((Result<T, MoyaError>) -> Void)
    ) -> Cancellable {
        return request(endpoint: endpoint) { result in
            switch result {
            case .success(let response):
                let jsonDecoder = JSONDecoder()
                do {
                    completion(.success(try jsonDecoder.decode(T.self, from: response.data)))
                } catch {
                    completion(.failure(MoyaError.underlying(error, response)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

//
//  ITSNetworkEndpointGroup.swift
//  ITSNetwork
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import Moya

public enum ITSNetworkEndpointGroup {
    case search(text: String, paginationNumber: Int)
}

extension ITSNetworkEndpointGroup: TargetType {
    
    public var baseURL: URL {
        switch self {
        default:
            return URL(string: "https://itunes.apple.com")!
        }
    }

    public var path: String {
        switch self {
        case .search:
            return "search"
        }
    }

    public var method: Moya.Method {
        switch self {
        default:
            return .get
        }
    }

    public var task: Task {
        switch self {
        default:
            return .requestParameters(
                parameters: bodyParameters,
                encoding: URLEncoding.default
            )
        }
    }

    public var headers: [String : String]? {
        switch self {
        default:
            return [
                "Content-Type": "application/json",
                "Accept": "application/json"
            ]
        }
    }

    private var bodyParameters: [String: String] {
        switch self {
        case .search(let text, let paginationNumber):
            return [
                "term": text,
                "limit": "\(paginationNumber)"
            ]
        }
    }
}

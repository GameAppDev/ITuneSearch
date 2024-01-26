//
//  ITSNetworkEndpointGroup.swift
//  ITSNetwork
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import Moya

public enum ITSNetworkEndpointGroup {
    case search
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
            return "/search"
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
            return .requestCompositeParameters(
                bodyParameters: bodyParameters,
                bodyEncoding: URLEncoding.default,
                urlParameters: urlParameters
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
        default: return [:]
        }
    }
    
    private var urlParameters: [String: String] {
        switch self {
        default: return [:]
        }
    }
}

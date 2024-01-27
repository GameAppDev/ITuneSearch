//
//  SearchResponseModel.swift
//  ITSNetwork
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation
import ITSUtils

public struct SearchResponseModel: Codable {
    public let resultCount: Int?
    public let results: [SearchResponseResult]?
}

public struct SearchResponseResult: Codable {
    public let releaseDate: String?
    public let country: String?
    public let imageUrlString: String?
    public let name: String?
    public let paginationType: String?
    
    enum CodingKeys: String, CodingKey {
        case releaseDate, country
        case imageUrlString = "artworkUrl100"
        case name = "collectionName"
        case paginationType = "wrapperType"
    }
}

public enum SearchResultPaginationType: String {
    case audiobook
    case track
    case collection
    case artist
    
    var name: String {
        switch self {
        case .audiobook: return "audiobook".localized
        case .track: return "track".localized
        case .collection: return "collection".localized
        case .artist: return "artist".localized
        }
    }
}

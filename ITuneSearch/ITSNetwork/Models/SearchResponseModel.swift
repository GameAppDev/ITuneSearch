//
//  SearchResponseModel.swift
//  ITSNetwork
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

public struct SearchResponseModel: Codable {
    public let resultCount: Int?
    public let results: [SearchResponseResult]?
}

public struct SearchResponseResult: Codable {
    public let wrapperType: String?
    public let releaseDate: String?
    public let country: String?
    public let imageUrlString: String?
    public let name: String?
    
    enum CodingKeys: String, CodingKey {
        case wrapperType, releaseDate, country
        case imageUrlString = "artworkUrl100"
        case name = "collectionName"
    }
}

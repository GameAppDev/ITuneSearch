//
//  SearchResponseModel.swift
//  ITSNetwork
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

struct SearchResponseModel: Codable {
    let resultCount: Int?
    let results: [SearchResponseResult]?
}

struct SearchResponseResult: Codable {
    let wrapperType: String?
    let releaseDate: String?
    let country: String?
    let imageUrlString: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case wrapperType, releaseDate, country
        case imageUrlString = "artworkUrl100"
        case name = "collectionName"
    }
}

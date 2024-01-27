//
//  ITSImageStorageProtocol.swift
//  ITSUtils
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

public protocol ITSImageStorageProtocol {

    func hasData(for url: URL) -> Bool
    func storeData(_ cachedUrlResponse: CachedURLResponse, forUrl: URL)
    func getData(for url: URL) -> Data?
}

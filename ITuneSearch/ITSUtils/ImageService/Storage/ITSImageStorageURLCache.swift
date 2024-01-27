//
//  ITSImageStorageURLCache.swift
//  ITSUtils
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import Foundation

public class ITSImageStorageURLCache: ITSImageStorageProtocol {

    private let fileCapacity: Int
    private let memoryCapacity: Int

    private let urlCache: URLCache

    public init(fileCapacity: Int, memoryCapacity: Int) {
        self.fileCapacity = fileCapacity
        self.memoryCapacity = memoryCapacity
        self.urlCache = URLCache()
        self.urlCache.diskCapacity = fileCapacity
        self.urlCache.memoryCapacity = memoryCapacity
    }

    public func hasData(for url: URL) -> Bool {
        return urlCache.cachedResponse(for: URLRequest(url: url)) != nil
    }

    public func storeData(_ cachedUrlResponse: CachedURLResponse, forUrl: URL) {
        urlCache.storeCachedResponse(cachedUrlResponse, for: URLRequest(url: forUrl))
    }

    public func getData(for url: URL) -> Data? {
        guard let cachedResponse = urlCache.cachedResponse(for: URLRequest(url: url))
        else { return nil }
        
        return cachedResponse.data
    }
}

//
//  ITSImageService.swift
//  ITSUtils
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

public class ITSImageService: ITSImageServiceProtocol {

    private var cache: ITSImageStorageProtocol

    public init(cache: ITSImageStorageProtocol) {
        self.cache = cache
    }

    public func getImage(
        imageURL: URL,
        completion: @escaping ((Result<UIImage, Error>) -> Void)
    ) -> URLSessionDataTask? {
        if cache.hasData(for: imageURL) {
            reloadFromCache(imageURL: imageURL, completion: completion)
            return nil
        } else {
            return download(imageURL: imageURL, completion: completion)
        }
    }
}

extension ITSImageService {
    
    private func download(
        imageURL: URL,
        completion: @escaping ((Result<UIImage, Error>) -> Void)
    ) -> URLSessionDataTask {
        let dataTask = URLSession.shared.dataTask(with: imageURL) { data, response, _ in
            if let data, let response {
                let cachedData = CachedURLResponse(response: response, data: data)
                self.cache.storeData(cachedData, forUrl: imageURL)
                guard let image = UIImage(data: data) else { return }
                
                DispatchQueue.main.async {
                    completion(.success(image))
                }
            }
        }
        DispatchQueue.global(qos: .userInitiated).async {
            dataTask.resume()
        }
        return dataTask
    }

    private func reloadFromCache(
        imageURL: URL,
        completion: @escaping ((Result<UIImage, Error>) -> Void)
    ) {
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = self.cache.getData(for: imageURL),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(.success(image))
                }
            }
        }
    }
}

//
//  ITSImageServiceProtocol.swift
//  ITSUtils
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit

public protocol ITSImageServiceProtocol {

    @discardableResult
    func getImage(
        imageURL: URL,
        completion: @escaping ((Result<UIImage, Error>) -> Void)
    ) -> URLSessionDataTask?
}

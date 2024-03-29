//
//  ListCollectionViewCell.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 27.01.2024.
//

import UIKit
import ITSUtils

final class ListCollectionViewCell: UICollectionViewCell {
    
    // MARK: Outlets
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    
    // MARK: Properties
    var imageDataTask: URLSessionDataTask?
    
    // MARK: Methods
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    
    private func setupViews() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            
            itemImageView.roundAllCorners(radius: .init(8))
            nameLabel.font = .listItemNameFont
            nameLabel.textColor = .listItemNameColour
        }
    }
    
    // MARK: Configure
    func configureCell(
        urlString: String?,
        name: String?,
        imageService: ITSImageServiceProtocol?
    ) {
        nameLabel.text = name ?? ""
        
        imageDataTask?.cancel()
        itemImageView.image = UIImage()
        if let urlString,
           let url = URL(string: urlString) {
            imageDataTask = imageService?.getImage(imageURL: url) { [weak self] result in
                guard let self else { return }

                switch result {
                case .success(let image):
                    itemImageView.image = image
                case .failure(let error):
                    debugPrint("<--- ListCollectionViewCell getImage Error: \(error.localizedDescription) --->")
                }
            }
        }
    }
}

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
    let imageService: ITSImageServiceProtocol
    var imageDataTask: URLSessionDataTask?
    
    // MARK: Init
    override init(frame: CGRect) {
        imageService = ITSDependencyContainer.getDefaultImageService()
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    
    private func setupViews() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            
            nameLabel.font = .listItemTextFont
            nameLabel.textColor = .listItemTextColour
        }
    }
    
    // MARK: Configure
    func configureCell(urlString: String?, name: String?) {
        nameLabel.text = name ?? ""
        
        imageDataTask?.cancel()
        itemImageView.image = UIImage()
        if let urlString,
           let url = URL(string: urlString) {
            imageDataTask = imageService.getImage(imageURL: url) { [weak self] result in
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

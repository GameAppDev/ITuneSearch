//
//  SearchDetailViewController.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 28.01.2024.
//

import UIKit
import ITSNetwork
import ITSUtils

final class SearchDetailViewController: BaseViewController {
    
    // MARK: Outlets
    @IBOutlet private weak var itemImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var countryLabel: UILabel!
    
    // MARK: Properties
    var presenter: ISearchDetailViewToPresenter?
}

extension SearchDetailViewController: ISearchDetailPresenterToView {
    
    func setNavigationBar(
        title: String?,
        leftButton: CustomNavigationBar.ButtonType?,
        rightButton: CustomNavigationBar.ButtonType?
    ) {
        setNavigationBarItems(
            title: title,
            leftButton: leftButton,
            rightButton: rightButton
        )
    }
    
    func setupImageView() {
        itemImageView.roundAllCorners(radius: .init(16))
    }
    
    func setImageView(
        urlString: String?,
        imageService: ITSImageServiceProtocol?
    ) {
        itemImageView.image = UIImage()
        if let urlString,
           let url = URL(string: urlString) {
            imageService?.getImage(imageURL: url) { [weak self] result in
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
    
    func setupNameLabel() {
        nameLabel.font = .detailItemNameFont
        nameLabel.textColor = .detailItemNameColour
    }
    
    func setupReleaseDateLabel() {
        releaseDateLabel.font = .detailItemReleaseDateFont
        releaseDateLabel.textColor = .detailItemReleaseDateColour
    }
    
    func setupCountryLabel() {
        countryLabel.font = .detailItemCountryFont
        countryLabel.textColor = .detailItemCountryColour
    }
    
    func setNameLabel(text: String?) {
        nameLabel.text = text ?? ""
    }
    
    func setReleaseDateLabel(text: String?) {
        releaseDateLabel.text = text ?? ""
    }
    
    func setCountryLabel(text: String?) {
        countryLabel.text = text ?? ""
    }
}

// MARK: Lifecycle
extension SearchDetailViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad?()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewWillAppear?()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        presenter?.viewWillLayoutSubviews?()
    }
}

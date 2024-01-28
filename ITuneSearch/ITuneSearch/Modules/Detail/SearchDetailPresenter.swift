//
//  SearchDetailPresenter.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 28.01.2024.
//

import Foundation
import ITSUtils

final class SearchDetailPresenter {
    
    // MARK: Properties
    weak var view: ISearchDetailPresenterToView?
    var interactor: ISearchDetailPresenterToInteractor?
    var router: ISearchDetailPresenterToRouter?
    var imageService: ITSImageServiceProtocol?
}

extension SearchDetailPresenter: ISearchDetailViewToPresenter {
    
    func viewDidLoad() {
        guard let listItem = interactor?.getListItem()
        else { return }
        
        view?.setImageView(
            urlString: listItem.imageUrlString,
            imageService: imageService
        )
        view?.setNameLabel(text: listItem.name)
        if let releaseDateString = listItem.releaseDate,
           let releaseDate = DateFormatter.iso8601WithTimeZoneDateFormatter.date(from: releaseDateString) {
            view?.setReleaseDateLabel(
                text: DateFormatter.dayAndLongMonthAndYearWithSpaceDateFormatter.string(from: releaseDate)
            )
        }
        view?.setCountryLabel(text: listItem.country)
    }
    
    func viewWillAppear() {
        view?.setNavigationBar(
            title: "detail".localized,
            leftButton: .back,
            rightButton: nil
        )
    }
    
    func viewWillLayoutSubviews() {
        view?.setupImageView()
        view?.setupNameLabel()
        view?.setupReleaseDateLabel()
        view?.setupCountryLabel()
    }
}

extension SearchDetailPresenter: ISearchDetailInteractorToPresenter { }

//
//  SearchDetailContractor.swift
//  ITuneSearch
//
//  Created by Oguzhan Yalcin on 28.01.2024.
//

import Foundation
import ITSNetwork
import ITSUtils

protocol ISearchDetailPresenterToView: IPresenterToView {
    func setNavigationBar(title: String?,
                          leftButton: CustomNavigationBar.ButtonType?,
                          rightButton: CustomNavigationBar.ButtonType?)
    func setupImageView()
    func setImageView(urlString: String?,
                      imageService: ITSImageServiceProtocol?)
    func setupNameLabel()
    func setupReleaseDateLabel()
    func setupCountryLabel()
    func setNameLabel(text: String?)
    func setReleaseDateLabel(text: String?)
    func setCountryLabel(text: String?)
}

protocol ISearchDetailViewToPresenter: IViewToPresenter { }

protocol ISearchDetailPresenterToInteractor: IPresenterToInteractor {
    func getListItem() -> SearchResponseResult?
}

protocol ISearchDetailInteractorToPresenter: IInteractorToPresenter { }

protocol ISearchDetailPresenterToRouter: IPresenterToRouter { }

//
//  HomeViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Shantaram K on 01/11/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import Foundation

protocol HomeViewPresentation: AnyObject {
   func getMenuCategory()
     func didSelect(menuCategory: MenuCategoryModel?)
}


final class HomeViewPresenter {
    
    //MAKR: - Properties
    
    private weak var view: HomeView?
    private var router: HomeViewWireFrame?
    private var interactor: HomeViewInteractor?

    init(view: HomeView,
         router: HomeViewWireFrame,
         interactor: HomeViewInteractor) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }

}

// Comply with Presenter's protocol

extension HomeViewPresenter: HomeViewPresentation {

    func getMenuCategory() {

        interactor?.fetchCategories(completion: { result in

            switch result {

            case .success(let menuCategories):

                self.view?.updateCategory(menuCategories ?? [])

            case .failure(_):

                self.view?.showErrorAlert()
            }
        })

    }

    func didSelect(menuCategory: MenuCategoryModel?) {

        self.router?.showCategoryDetail(menuCategory)
    }

}

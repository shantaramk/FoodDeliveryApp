//
//  HomeViewRouter.swift
//  FoodDeliveryApp
//
//  Created by Shantaram K on 01/11/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewWireFrame {

    func showCategoryDetail(_ category: MenuCategoryModel?)
}

class HomeViewRouter {

    // ViewController is required for screen transition. Receive in init

    private unowned let viewController: UIViewController

    private init(viewController: UIViewController) {
        self.viewController = viewController
    }

    // DI
    static func assembleModules() -> UIViewController {

        guard let homeViewController: HomeViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
            fatalError()
        }
        
        let view = homeViewController
        let router = HomeViewRouter(viewController: view)
        let interactor = HomeViewInteractor()

        // Presenter is required for View, Interactor, Router respectively
        // Generate and pass as an init argument

        let presenter = HomeViewPresenter(view: view, router: router, interactor: interactor)

        view.presenter = presenter // Set Presenter in View

        return view
    }
}

extension HomeViewRouter: HomeViewWireFrame {

    func showCategoryDetail(_ category: MenuCategoryModel?) {


        
    }

}

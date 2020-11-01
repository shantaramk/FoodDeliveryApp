//
//  CartViewController.swift
//  FoodDeliveryApp
//
//  Created by Shantaram K on 01/11/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import Foundation
import UIKit

class CartRootViewController: UIViewController {
    //MARK:- Properties
    
    @IBOutlet weak var bottomControls: HomeBottomControlsStackView!

    private let dayViewController: CartListViewController = {
        let cartViewController = CartListViewController()
        cartViewController.view.translatesAutoresizingMaskIntoConstraints = false
        return cartViewController
    }()

    private let weekViewController: CartListViewController = {
        let cartViewController = CartListViewController()
        cartViewController.view.translatesAutoresizingMaskIntoConstraints = false
        return cartViewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        bottomControls.distribution = .fillEqually
        bottomControls.menuList.removeAll()
        bottomControls.menuList = ["Cart", "Order", "Info"]

        //Setup Child View Controller
        setupChildViewControllers()
        configureCartView()

    }
    //MARK: - Helper Methods

    func configureCartView() {
        bottomControls.delegate = self
         bottomControls.backgroundColor = .white
    }


    private func setupChildViewControllers() {
        addChild(dayViewController)
        addChild(weekViewController)

        view.addSubview(dayViewController.view)
        view.addSubview(weekViewController.view)

        dayViewController.view.topAnchor.constraint(equalTo: self.bottomControls.bottomAnchor).isActive = true
        dayViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dayViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //dayViewController.view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        dayViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true


        weekViewController.view.topAnchor.constraint(equalTo: dayViewController.view.bottomAnchor, constant: 50).isActive = true
        weekViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        weekViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        weekViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        dayViewController.didMove(toParent: self)
        weekViewController.didMove(toParent: self)
    }

}

extension CartRootViewController: HomeBottomControlsDelegate {
    func homeBottomControlsView(_ view: HomeBottomControlsStackView, didSelect index: Int, sender: UIButton) {

    }


}

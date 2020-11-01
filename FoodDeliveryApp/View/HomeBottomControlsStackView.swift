//
//  HomeBottomControlsStackView.swift
//  FoodDeliveryApp
//
//  Created by Shantaram K on 31/10/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import Foundation
import UIKit


class HomeBottomControlsStackView: UIStackView {

    static func createButton(name: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(name, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.setTitleColor(.lightGray, for: .normal)
        return button
    }

    var firstButton: UIButton?

    var menuList = [String]() {
        didSet {
             self.configureView()
        }
    }

    private var buttonList = [UIButton]()

    var delegate: HomeBottomControlsDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        distribution = .fillEqually
        heightAnchor.constraint(equalToConstant: 90).isActive = true

    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func configureView() {
        if  !self.isViewEmpty {
            return
        }

        menuList.enumerated().forEach { (index, title) in
            let button = HomeBottomControlsStackView.self.createButton(name: title)
            if index == 0 {
                firstButton = button
            }
            button.tag = index
            button.addTarget(self, action: #selector(handleClicked(_:)), for: .touchUpInside)
            addArrangedSubview(button)
            buttonList.append(button)
        }

        if let firstButton = self.firstButton {
            setActiveTab(firstButton)
        }
    }

    func setActiveTab(_ selectedButton: UIButton) {

        let buttons = buttonList

        for button in buttons {
             if button == selectedButton {
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
                button.setTitleColor(.black, for: .normal)
            } else {
                button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
                button.setTitleColor(.lightGray, for: .normal)
            }
        }

    }
}

//MARK: - Action

extension HomeBottomControlsStackView {

    @objc func handleClicked(_ button: UIButton) {
        if self.delegate != nil {
            setActiveTab(button)
            self.delegate?.homeBottomControlsView(self, didSelect: button.tag, sender: button)
        }
    }
}

extension UIView {
    var isViewEmpty : Bool {
        return  self.subviews.count == 0 ;
    }
}

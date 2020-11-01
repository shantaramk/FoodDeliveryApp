//
//  CategoryView.swift
//  FoodDeliveryApp
//
//  Created by Shantaram K on 31/10/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class CategoryView: UICollectionReusableView {

    @IBOutlet weak var containerView: UIView!

lazy var bottomControls: HomeBottomControlsStackView = {
        let bottomStackView = HomeBottomControlsStackView()
         bottomStackView.backgroundColor = .white
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        return bottomStackView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

     }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupBottomControlsView()

     }


    fileprivate func setupBottomControlsView() {
        bottomControls.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bottomControls)
        bottomControls.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: 0).isActive = true
        bottomControls.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 10).isActive = true
        bottomControls.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: -10).isActive = true
        bottomControls.topAnchor.constraint(equalTo: self.containerView.topAnchor, constant: 0).isActive = true

    }

    func setData(_ categories: [MenuCategoryModel]) {
        bottomControls.menuList.removeAll()
        bottomControls.menuList = categories.map { $0.category ?? "" }
    }
}


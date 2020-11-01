//
//  Protocols.swift
//  FoodDeliveryApp
//
//  Created by Shantaram K on 31/10/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import Foundation
import UIKit

protocol HomeBottomControlsDelegate {

    func homeBottomControlsView(_ view: HomeBottomControlsStackView, didSelect index: Int, sender: UIButton)
}

protocol CartButtonViewDelegate {

    func cartButtonView(_ view: CartButtonView, didClicked sender: UIButton)
}

protocol ViewModelProtocol {

    func categoryMenuList(completion: @escaping(Bool, String, [MenuCategoryModel]?) -> Void)

}

protocol HomeViewModelProtocol: ViewModelProtocol {

}

protocol InfoModelProtocol {

}

protocol FoodCellDelegate {
    
    func foodCell(_ cell: FoodViewCell, didSelect menu: Menu?, sender: UIButton)

}

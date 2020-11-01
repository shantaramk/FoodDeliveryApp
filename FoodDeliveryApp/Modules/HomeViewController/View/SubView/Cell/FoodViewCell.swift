//
//  FoodViewCell.swift
//  FoodDeliveryApp
//
//  Created by Shantaram K on 30/10/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class FoodViewCell: UICollectionViewCell {

    //MAKR:- Properties

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var cartButton: UIButton!

    var menu: Menu?

    var delegate: FoodCellDelegate?


    //MAKR:- UIView

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureUI()
    }

    func setData(_ menu: Menu?) {
        self.menu = menu
        if let menu = menu {
            self.titleLabel.text = menu.name
            self.descriptionLabel.text = menu.description
            self.imageView.image = UIImage(named: menu.image!)
        }
    }

}

//MAKR:- Configure UI

extension FoodViewCell {

    func configureUI() {
        configureView()
        configureButton()
    }

    func configureView() {
        containerView.layer.borderColor = UIColor.gray.cgColor
        containerView.layer.borderWidth = 0.3
        containerView.layer.cornerRadius = 12.0

        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowOpacity  = 0.7
        containerView.layer.shadowRadius = 5

        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12.0
        imageView.layer.maskedCorners =  [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    func configureButton() {
        cartButton.layer.borderColor = UIColor.gray.cgColor
        cartButton.layer.borderWidth = 0.3
        cartButton.layer.cornerRadius = 12.0
    }
}

//MAKR:- Action

extension FoodViewCell {

    @IBAction func addCartButtonClick(_ sender: UIButton) {

        if let delegate = self.delegate {
            delegate.foodCell(self, didSelect: self.menu, sender: sender)
        }

    }
}

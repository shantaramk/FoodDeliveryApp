//
//  CartButtonView.swift
//  FoodDeliveryApp
//
//  Created by Shantaram K on 01/11/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class CartButtonView: UIView {

    //MARK: - Protperties

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var cartButton: UIButton!

    var delegate: CartButtonViewDelegate?

    var counter: Int = 0 {
        didSet {
            self.animateView()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureUI()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        configureLabel()
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


}

//MARK: - Configure UI

extension CartButtonView {

    func configureUI() {
        //configureLabel()
        setupView()
    }

    func configureLabel() {
        self.countLabel.superview!.layer.cornerRadius = self.countLabel.superview!.frame.height / 2
        layer.cornerRadius = self.frame.height / 2

    }

    func setupView() {

        let customView = loadNibFile()

        //set frame based on the current screen

        customView.frame = bounds

        customView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        addSubview(customView)
    }

    func loadNibFile() -> UIView {

        let bundle = Bundle(for: type(of: self))
        let nibFile = UINib(nibName: "CartButtonView", bundle: bundle)
        let viewFile = nibFile.instantiate(withOwner: self, options: nil)[0] as! UIView
        return viewFile
    }

    func animateView() {
        self.countLabel.text = "\(String(describing: counter + 1))"
        self.countLabel.superview!.transform = .identity
        UIView.animate(withDuration: 0.5, animations: {
            self.countLabel.superview!.transform = .init(scaleX: 0.7, y: 0.7)
        }) { ( _ ) in

        }
    }
 }

//MARK: - Action

extension CartButtonView {

    @IBAction func cartButtonClick(_ sender: UIButton) {
        if let delegate = self.delegate {
            delegate.cartButtonView(self, didClicked: sender)
        }
    }
}

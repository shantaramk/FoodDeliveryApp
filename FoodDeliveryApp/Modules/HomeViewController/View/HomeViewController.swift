//
//  HomeViewController.swift
//  FoodDeliveryApp
//
//  Created by Shantaram K on 30/10/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

protocol HomeView: AnyObject {
    func updateCategory(_ categories: [MenuCategoryModel])
    func showErrorAlert()
}


class HomeViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var cartButtonView: CartButtonView!



    var bannerView: BannerCell?

    var activeMenuCategory: MenuCategoryModel?

    var viewModel = HomeViewModel()

    var menuCategoryModel: [MenuCategoryModel] = [] {
        didSet {
            self.activeMenuCategory = self.menuCategoryModel.first

            self.collectionview!.reloadData()
        }
    }

    
    //Access to Presenter is done via protocol
    var presenter: HomeViewPresentation?

    //MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.fetchMenuListAPI()
        configureView()
    }


}

//MARK:- Configure UI

extension HomeViewController {

    func configureView() {
        configureCartView()
        configureCollectionView()
    }

    func configureCartView() {
        cartButtonView.delegate = self
        cartButtonView.layer.cornerRadius = self.cartButtonView.frame.height / 2
        cartButtonView.backgroundColor = .white
    }

    func configureCollectionView() {
        collectionview.register(UINib(nibName: "FoodViewCell", bundle: nil), forCellWithReuseIdentifier: "FoodViewCell")
        collectionview.register(UINib(nibName: "BannerCell", bundle: nil), forCellWithReuseIdentifier: "BannerCell")
        collectionview.register(UINib(nibName: "CategoryView", bundle: nil), forSupplementaryViewOfKind: "CategoryViewID", withReuseIdentifier: "CategoryView")
        collectionview.collectionViewLayout = CollectionLayoutManager.shared.createDistinctSectionsLayout()
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.isScrollEnabled = true
        collectionview.reloadData()
    }
}

//MARK: - Private Method

fileprivate extension HomeViewController {

    func fetchMenuListAPI() {

        presenter?.getMenuCategory()

    }
}

//MARK:-Home BottomC ontrols Delegate

extension HomeViewController: HomeBottomControlsDelegate {

    func homeBottomControlsView(_ view: HomeBottomControlsStackView, didSelect index: Int, sender: UIButton) {
        self.activeMenuCategory = self.menuCategoryModel[index]
        self.collectionview.reloadData()
    }

}

//MARK:- Cart Button Delegate

extension HomeViewController: CartButtonViewDelegate {

    func cartButtonView(_ view: CartButtonView, didClicked sender: UIButton) {
         guard let cartViewController: CartRootViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CartRootViewController") as? CartRootViewController else {
            fatalError()
        }
        self.present(cartViewController, animated: true, completion: nil)
     }

}

//MARK:- Food Cell Delegate

extension HomeViewController: FoodCellDelegate {

    func foodCell(_ cell: FoodViewCell, didSelect menu: Menu?, sender: UIButton) {
        self.cartButtonView.counter = 1
        sender.setTitle("Added +1", for: .normal)
        sender.backgroundColor = .green
    }
}


// Comply with View protocol
extension HomeViewController: HomeView {

    func updateCategory(_ categories: [MenuCategoryModel]) {
        self.menuCategoryModel = categories
    }

    func showErrorAlert() {
        let alert = UIAlertController(title: "Network Error", message: "Please wait a while and try again", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

//
//  HomeViewController.swift
//  FoodDeliveryApp
//
//  Created by Shantaram K on 30/10/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    //MARK: - Properties
    
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var cartButtonView: CartButtonView!

    var menuCategoryModel = [MenuCategoryModel]() {
        didSet {
            self.activeMenuCategory = menuCategoryModel.first
        }
    }

    var bannerView: BannerCell?

    var activeMenuCategory: MenuCategoryModel?

    var viewModel = HomeViewModel()

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

        viewModel.categoryMenuList { error, messsage, result in

            if error {
                self.menuCategoryModel = result ?? []

                self.collectionview.reloadData()
            }
        }
    }
}
//MARK:- UICollection View Data Source

extension HomeViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        } else {
            return self.activeMenuCategory?.menu?.count ?? 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if indexPath.section == 0 {
            guard let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCell else { fatalError()}
            bannerCell.pageControl.currentPage = indexPath.row
            self.bannerView = bannerCell
            return bannerCell
        } else {

            guard let foodViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodViewCell", for: indexPath) as? FoodViewCell else { fatalError()}
            foodViewCell.delegate = self
            if let menuList = self.activeMenuCategory?.menu {
                foodViewCell.setData(menuList[indexPath.row])
            }

            return foodViewCell
        }

    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        guard let headerView =  collectionView.dequeueReusableSupplementaryView(ofKind: "CategoryViewID", withReuseIdentifier: "CategoryView", for: indexPath) as? CategoryView else { fatalError() }
        headerView.bottomControls.delegate = self
        headerView.setData(self.menuCategoryModel)
           return headerView
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:collectionView.frame.size.width, height:50)
    }
}

//MARK:- UICollection View Delegate

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      /*  let cell = collectionView.cellForItem(at: indexPath)
        cell?.superview?.bringSubviewToFront(cell!)
        cell?.frame = collectionView.frame
 */
    }
}

//MARK:- UIScroll View Delegate

extension HomeViewController: UIScrollViewDelegate {

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {

    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(#function, scrollView.contentOffset.y)

        let a = scrollView.contentOffset.y/100
        //print(a)
        if scrollView.contentOffset.y < 500 {

            self.bannerView?.transform = CGAffineTransform.init(translationX: 1, y: -a * 18)

        } else {
            self.bannerView?.transform = CGAffineTransform.init(translationX: 1, y:1)

        }
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

    }

}

//MARK:- Food Cell Delegate

extension HomeViewController: FoodCellDelegate {

    func foodCell(_ cell: FoodViewCell, didSelect menu: Menu?, sender: UIButton) {
        self.cartButtonView.counter = 1

    }

}

extension HomeViewController {

    func getData() {
        if let path = Bundle.main.path(forResource: "MenuInfo", ofType: "json") {
            let url = URL(fileURLWithPath: path)
            do {
                let data = try Data(contentsOf: url, options: .mappedIfSafe)

                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [Any] {
                    // do stuff
                    print(jsonResult)
                }


                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode([MenuCategoryModel].self, from: data)
                self.menuCategoryModel = responseModel

                self.collectionview.reloadData()

            } catch {
                print(error)
            }
        }
    }
}

//
//  HomeViewController+CollectionView.swift
//  FoodDeliveryApp
//
//  Created by Shantaram K on 01/11/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import Foundation
import UIKit

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

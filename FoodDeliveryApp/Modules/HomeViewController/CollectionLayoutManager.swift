//
//  CollectionLayoutManager.swift
//  FoodDeliveryApp
//
//  Created by Shantaram K on 01/11/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import Foundation
import UIKit


class CollectionLayoutManager {

    private init() {}

    static let shared = CollectionLayoutManager()
 
}

//MARK:- Distinct Sections Layout

extension CollectionLayoutManager {

    func createDistinctSectionsLayout() -> UICollectionViewLayout {

        //Item Size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension:  .fractionalHeight(1.0))
        //item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let spacing = CGFloat(10)

        //group Size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(100))
        //group
        //let gourp = NSCollectionLayoutGroup(layoutSize: groupSize, supplementaryItems: [NSCollectionLayoutSupplementaryItem])
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)

        group.interItemSpacing = .fixed(spacing)

        //Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)

        //Layout
        let layout = UICollectionViewCompositionalLayout { (section, _) -> NSCollectionLayoutSection? in

            if section == 0 {
                return self.bannerLayout()
            } else {
                return self.listItemLayout()
            }
        }
        return layout
    }

    func bannerLayout() -> NSCollectionLayoutSection {
        //Item Size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension:  .fractionalHeight(1.0))
        //item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let spacing = CGFloat(0)

        //group Size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(0.7))
        //group
        //let gourp = NSCollectionLayoutGroup(layoutSize: groupSize, supplementaryItems: [NSCollectionLayoutSupplementaryItem])
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)

        group.interItemSpacing = .fixed(spacing)

        //Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .paging
        return section
    }

    func listItemLayout() -> NSCollectionLayoutSection {
        //Item Size
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension:  .fractionalHeight(1.0))
        //item
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        //group Size
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(320))
        //group
        //let gourp = NSCollectionLayoutGroup(layoutSize: groupSize, supplementaryItems: [NSCollectionLayoutSupplementaryItem])
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        let spacing = CGFloat(8)

        group.interItemSpacing = .fixed(spacing)

        //Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing

        //Header for section
        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(80.0)),
                                                    elementKind: "CategoryViewID", alignment: .topLeading)]
        return section

    }
}

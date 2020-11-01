//
//  CategoryMenuRepositoryMock.swift
//  FoodDeliveryApp
//
//  Created by Shantaram K on 01/11/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class CategoryMenuRepositoryMock: DataRepository {
    
    func create(user: MenuCategoryModel) {
         
    }

    func getAll() -> [MenuCategoryModel]? {
        let url  = JsonPersistentSrorage.shared.filePath
        do {
            let data = try Data(contentsOf: url!, options: .mappedIfSafe)

            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let jsonResult = jsonResult as? [Any] {
                print(jsonResult)
            }

            let jsonDecoder = JSONDecoder()
            let responseModel = try jsonDecoder.decode([MenuCategoryModel].self, from: data)
            return responseModel

        } catch {
            print(error)
        }
        return []
    }

    func update(user: MenuCategoryModel, isFavourite: Bool) {

    }


}

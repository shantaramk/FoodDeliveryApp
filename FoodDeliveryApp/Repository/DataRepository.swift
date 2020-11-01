//
//  DataRepository.swift
//  DigitasCodingAssignment
//
//  Created by Shantaram K on 17/08/20.
//  Copyright © 2020 Shantaram Kokate. All rights reserved.
//

import Foundation

protocol DataRepository {
    
    func create(user: MenuCategoryModel)
    
    func getAll() -> [MenuCategoryModel]?
    
    //func get(byIdentifier id: String) -> UserInfoBaseModel?
    
    func update(user: MenuCategoryModel, isFavourite: Bool)
    
    //func delete(id: String) -> Bool
}

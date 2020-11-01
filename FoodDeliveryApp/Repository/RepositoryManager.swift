//
//  RepositoryManager.swift
//  DigitasCodingAssignment
//
//  Created by Shantaram K on 24/07/20.
//  Copyright © 2020 Shantaram Kokate. All rights reserved.
//

import UIKit

struct RepositoryManager {

      // The DataRepository maintains a reference to an object of the User Data Repository class (As Of Now because it will change it requirement arise for core data).
    // It can be either lazy-loaded
    
    private var dataRepository: DataRepository?

    //Initialized with User Respository
    
    init(with dataRepository: DataRepository) {
        
        self.dataRepository = dataRepository
    }

    func getAll() -> [MenuCategoryModel]? {
        return dataRepository?.getAll()
    }

}

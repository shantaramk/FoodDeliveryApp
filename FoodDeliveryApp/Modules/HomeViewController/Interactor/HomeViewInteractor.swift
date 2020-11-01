//
//  HomeViewRepositoryInteractor.swift
//  FoodDeliveryApp
//
//  Created by Shantaram K on 01/11/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

enum NetworkError: Error {
    case badURL
}

protocol HomeViewUseCase: AnyObject {

    func fetchCategories(completion: @escaping (Result<[MenuCategoryModel]?, NetworkError>) -> Void)
}

final class HomeViewInteractor {


    // API client for contacting GitHub
    
    // To replace the API client with Mock when testing Interactor so that it returns an arbitrary response

    private let manager = RepositoryManager(with: CategoryMenuRepositoryMock())

}


extension HomeViewInteractor: HomeViewUseCase {
    
    func fetchCategories(completion: @escaping (Result<[MenuCategoryModel]?, NetworkError>) -> Void) {

        if let result = manager.getAll() {

            completion(.success(result))

        } else {

            completion(.failure(.badURL))
        }

    }

}

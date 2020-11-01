//
//  JsonPersistentSrorage.swift
//  FoodDeliveryApp
//
//  Created by Shantaram K on 01/11/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

class JsonPersistentSrorage {

    private init(){}

    static let shared = JsonPersistentSrorage()

    var filePath: URL? {

        if let path = Bundle.main.path(forResource: "MenuInfo", ofType: "json") {

            let url = URL(fileURLWithPath: path)
            return url
        }
        return nil
     }

}

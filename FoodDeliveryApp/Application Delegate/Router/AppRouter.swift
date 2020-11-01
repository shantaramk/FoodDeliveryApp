//
//  RootRouter.swift
//  viper-sample
//
//  Created by hicka04 on 2018/07/26.
//  Copyright © 2018年 hicka04. All rights reserved.
//

import UIKit

protocol AppWireframe: AnyObject {
    func showHomeView()
}

final class AppRouter {
    private let window: UIWindow
    
    private init(window: UIWindow) {
        self.window = window
    }
    
    static func assembleModules(window: UIWindow) -> AppPresentation {
        let router = AppRouter(window: window)
        let presenter = AppPresenter(router: router)
        
        return presenter
    }
}

extension AppRouter: AppWireframe {
    func showHomeView() {
        let repositorySearchResultView = HomeViewRouter.assembleModules()
        let navigationController = UINavigationController(rootViewController: repositorySearchResultView)
        window.makeKeyAndVisible()

        window.rootViewController = navigationController
    }
}

//
//  AppDelegate.swift
//  FoodDeliveryApp
//
//  Created by Shantaram K on 30/10/20.
//  Copyright © 2020 Shantaram K. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   // let appPresenter = AppRouter.assembleModules(window: UIWindow(frame: UIScreen.main.bounds))
    var window: UIWindow!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
      //appPresenter.didFinishLaunch()
        window = UIWindow(frame: UIScreen.main.bounds)
        let homeView = HomeViewRouter.assembleModules()
 

        window = UIWindow(frame: UIScreen.main.bounds)
         window.rootViewController = homeView
        window.makeKeyAndVisible()

        return true


     }
    func showHomeView() {
        let homeView = HomeViewRouter.assembleModules()
        let navigationController = UINavigationController(rootViewController: homeView)


         // Create the window. Be sure to use this initializer and not the frame one.
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()

    }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


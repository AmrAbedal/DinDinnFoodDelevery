//
//  AppDelegate.swift
//  DinDinnFoodDelevery
//
//  Created by Amr AbdelWahab on 10/8/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        setRootViewController()
        return true
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window?.makeKeyAndVisible()
        return true
    }
    private func setRootViewController() {
        let window = UIWindow.init(frame: UIScreen.main.bounds)
        let homeViewController = DefaultHomeConfigurator.configure( presenter: DefaultHomeScreenPresenter.init(interactor: DefaultHomeScreenInteractor(dataSource: MockHomeDataSource())), router: DefaultHomeScreenRouter())
        window.rootViewController = homeViewController
        self.window = window
        
        
    }
}


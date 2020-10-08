//
//  HomeConfigurator.swift
//  DinDinnFoodDelevery
//
//  Created by Amr AbdelWahab on 10/8/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import Foundation

protocol HomeConfigurator {
    static func configure(presenter:HomeScreenPresenter,router: HomeScreenRouter) -> HomeViewController
}

class DefaultHomeConfigurator: HomeConfigurator {
    static func configure(presenter: HomeScreenPresenter, router: HomeScreenRouter) -> HomeViewController {
    let homeViewController = HomeViewController.init(presenter: presenter)
        return homeViewController
    }
}

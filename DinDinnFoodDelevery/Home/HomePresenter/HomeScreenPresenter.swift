//
//  HomeScreenPresenter.swift
//  DinDinnFoodDelevery
//
//  Created by Amr AbdelWahab on 10/8/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import Foundation
import RxSwift

protocol HomeScreenPresenter {
    var interactor: HomeScreenInteractor {get set}
    var dataSubject: BehaviorSubject<HomeScreenState?> {get set}
    func fetchData() 
}



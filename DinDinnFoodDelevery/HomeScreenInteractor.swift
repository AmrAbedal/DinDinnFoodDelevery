//
//  HomeScreenInteractor.swift
//  DinDinnFoodDelevery
//
//  Created by Amr AbdelWahab on 10/8/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import Foundation
import RxSwift

struct HomeScreenInteractorDataModel {
    let name: String
}

protocol HomeScreenInteractor {
    func fetchData() -> Single<HomeScreenInteractorDataModel>
}

class DefaultHomeScreenInteractor: HomeScreenInteractor {
    let dataSource: HomeScreeanDataSource
    init(dataSource: HomeScreeanDataSource) {
        self.dataSource = dataSource
    }
    func fetchData() -> Single<HomeScreenInteractorDataModel> {
    return Single.just(HomeScreenInteractorDataModel(name: "Amr"))
    }
}

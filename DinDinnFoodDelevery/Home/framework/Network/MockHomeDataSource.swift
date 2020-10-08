//
//  MockHomeDataSource.swift
//  DinDinnFoodDelevery
//
//  Created by Amr AbdelWahab on 10/8/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import Foundation
import RxSwift

class MockHomeDataSource: HomeScreeanDataSource {
    func FetchHomeData() -> Single<HomeData> {
        return Single.just(HomeData())
    }
}

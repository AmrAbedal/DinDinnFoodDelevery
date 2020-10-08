//
//  HomeScreeanDataSource.swift
//  DinDinnFoodDelevery
//
//  Created by Amr AbdelWahab on 10/8/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import Foundation
import RxSwift
import ObjectMapper
import Moya


protocol HomeScreeanDataSource {
    func FetchHomeData() -> Single<HomeData>
}


extension Mapper {
    func mapData(jsonObject: Any?) throws -> N {
        if let data = map(JSONObject: jsonObject) {
            return data
        } else {
            throw NSError.init()
        }
    }
}


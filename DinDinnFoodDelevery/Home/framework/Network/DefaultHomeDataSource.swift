//
//  DefaultHomeDataSource.swift
//  DinDinnFoodDelevery
//
//  Created by Amr AbdelWahab on 10/8/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import ObjectMapper

class DefaultHomeDataSource: HomeScreeanDataSource {
    private let provider = MoyaProvider<HomeEndPoint>()
    func FetchHomeData() -> Single<HomeData> {
        return provider.rx
            .request(.home)
            .map{
                let json = try JSONSerialization.jsonObject(with: $0.data, options: [])
                return try Mapper<HomeData>().mapData(jsonObject: json)
        }
    }
}

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

class HomeData: Mappable {
    var mealName: String?
    
    required init?(map: Map) {
        
    }
    // Mappable
    func mapping(map: Map) {
        mealName    <- map["mealName"]
    }
    init() {
        mealName = "Good food"
    }
}

protocol HomeScreeanDataSource {
    func FetchHomeData() -> Single<HomeData>
}

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

extension Mapper {
    func mapData(jsonObject: Any?) throws -> N {
        if let data = map(JSONObject: jsonObject) {
            return data
        } else {
            throw NSError.init()
        }
    }
}

class MockHomeDataSource: HomeScreeanDataSource {
    func FetchHomeData() -> Single<HomeData> {
        return Single.just(HomeData())
    }
}

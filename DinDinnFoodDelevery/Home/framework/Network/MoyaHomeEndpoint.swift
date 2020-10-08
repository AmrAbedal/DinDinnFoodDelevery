//
//  MoyaHomeEndpoint.swift
//  DinDinnFoodDelevery
//
//  Created by Amr AbdelWahab on 10/8/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import Foundation
import Moya

extension HomeEndPoint: TargetType {
    var baseURL: URL {
        return URL.init(string: "https://baseURL")!
    }
    
    var path: String {
        switch self {
        case .home:
            return "/home"
        }
    }
    var method: Moya.Method {
        switch self {
        case.home: return .get
            
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .home:
            return Task.requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Authorization":"Token"]
    }
}

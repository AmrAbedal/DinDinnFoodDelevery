//
//  HomeData.swift
//  DinDinnFoodDelevery
//
//  Created by Amr AbdelWahab on 10/8/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import Foundation
import ObjectMapper

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

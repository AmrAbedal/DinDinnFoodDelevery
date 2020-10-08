//
//  HomeData.swift
//  DinDinnFoodDelevery
//
//  Created by Amr AbdelWahab on 10/8/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import Foundation
import ObjectMapper

class Status: Mappable {
    var code: Int?
    var message: String?
    required init?(map: Map) {
        
    }
    // Mappable
    func mapping(map: Map) {
        code    <- map["message"]
        message    <- map["message"]
    }
    init() {
        code = 200
        message = "Success"
    }
}
class HomeData: Mappable {
    var status: Status?
    var items: [Item]?
    
    required init?(map: Map) {
        
    }
    // Mappable
    func mapping(map: Map) {
        status    <- map["status"]
        items <- map["items"]
    }
    init() {
        status = Status.init()
        items = [Item(),Item(),Item(),Item(),Item()]
    }
}

class Item: Mappable {
    var name: String?
    var price: Int?
    required init?(map: Map) {
        
    }
    // Mappable
    func mapping(map: Map) {
        name    <- map["name"]
        price    <- map["price"]
    }
    init() {
        name = "Crepe"
        price = 300
    }
}

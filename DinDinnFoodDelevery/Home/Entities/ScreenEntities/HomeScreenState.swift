//
//  HomeScreenState.swift
//  DinDinnFoodDelevery
//
//  Created by Amr AbdelWahab on 10/8/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import Foundation

enum HomeScreenState {
    case loading
    case success([HomeScreenData])
    case failure(error:String)
}

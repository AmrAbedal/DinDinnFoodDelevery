//
//  HomeScreenInteractor.swift
//  DinDinnFoodDelevery
//
//  Created by Amr AbdelWahab on 10/8/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import Foundation
import RxSwift


protocol HomeScreenInteractor {
    func fetchData() -> Single<HomeScreenState>
}

class DefaultHomeScreenInteractor: HomeScreenInteractor {
    let dataSource: HomeScreeanDataSource
    init(dataSource: HomeScreeanDataSource) {
        self.dataSource = dataSource
    }
    func fetchData() -> Single<HomeScreenState> {
        return dataSource.FetchHomeData().map({
            self.get(data: $0)
        })
    }
    private func get(data: HomeData) -> HomeScreenState {
        if data.status?.code == 200 , let items = data.items {
            return .success(items.map({getItemData(item: $0)}))
        } else {
            return .failure(error: "")
        }
    }
    private func getItemData(item: Item ) -> HomeScreenData {
        return  HomeScreenData.init(name: item.name ?? "", price: item.price ?? 0, Image: "download")
    }
}

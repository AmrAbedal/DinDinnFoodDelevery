//
//  HomeScreenPresenter.swift
//  DinDinnFoodDelevery
//
//  Created by Amr AbdelWahab on 10/8/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import Foundation
import RxSwift

struct HomeScreenData {
    
}
enum HomeScreenState {
    case loading
    case success(HomeScreenData)
    case failure(error:String)
}

protocol HomeScreenPresenter {
    var interactor: HomeScreenInteractor {get set}
    var dataSubject: BehaviorSubject<HomeScreenState> {get set}
}

class  DefaultHomeScreenPresenter: HomeScreenPresenter {
    private let disposable = DisposeBag()
    internal var interactor: HomeScreenInteractor
    var dataSubject: BehaviorSubject<HomeScreenState> = BehaviorSubject<HomeScreenState>(value: .loading)
    
    init(interactor:HomeScreenInteractor ) {
        self.interactor = interactor
    }
    func fetchData() {
        interactor.fetchData().subscribe(onSuccess: { result in
            self.dataSubject.onNext(.success(HomeScreenData.init()))
        }, onError: {error in
            self.dataSubject.onNext(.failure(error: error.localizedDescription))
        }).disposed(by: disposable)
    }
    
    
}
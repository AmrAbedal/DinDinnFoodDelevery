//
//  DefaultHomeScreenPresenter.swift
//  DinDinnFoodDelevery
//
//  Created by Amr AbdelWahab on 10/8/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import Foundation
import RxSwift

class DefaultHomeScreenPresenter: HomeScreenPresenter {
    
    private let disposable = DisposeBag()
    internal var interactor: HomeScreenInteractor
    var dataSubject: BehaviorSubject<HomeScreenState?> = BehaviorSubject<HomeScreenState?>(value: nil)
    
    init(interactor:HomeScreenInteractor ) {
        self.interactor = interactor
    }
    func fetchData() {
        dataSubject.onNext(.loading)
        interactor.fetchData().subscribe(onSuccess: { result in
            self.dataSubject.onNext(result)
        }, onError: {error in
            self.dataSubject.onNext(.failure(error: error.localizedDescription))
        }).disposed(by: disposable)
    }
}

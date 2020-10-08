//
//  HomeViewController.swift
//  DinDinnFoodDelevery
//
//  Created by Amr AbdelWahab on 10/8/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import UIKit
import RxSwift
class HomeViewController: UIViewController {
    private let disposable = DisposeBag()
    private var presenter: HomeScreenPresenter
    init(presenter: HomeScreenPresenter) {
        self.presenter = presenter
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubscribers()
        // Do any additional setup after loading the view.
    }
    private func setupSubscribers() {
        presenter.dataSubject.subscribe({[weak self] event in
            if let element = event.element {
                self?.handleScreenState(state: element)
            }
            }).disposed(by: disposable)
    }
    private func handleScreenState(state: HomeScreenState) {
        
    }
}

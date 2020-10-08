//
//  HomeViewController.swift
//  DinDinnFoodDelevery
//
//  Created by Amr AbdelWahab on 10/8/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import UIKit
import RxSwift
import ImageSlideshow
class HomeViewController: UIViewController {
    
    @IBOutlet weak var itemsTablView: UITableView!
    @IBOutlet weak var imageSlider: ImageSlideshow!
    private var items: [HomeScreenData] = []
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
        setupImageSlider()
        setupTableView()
        setupSubscribers()
        presenter.fetchData()
        // Do any additional setup after loading the view.
    }
    private func setupImageSlider() {
        imageSlider.setImageInputs([
            ImageSource(image: UIImage(named: "download")!),
            ImageSource(image: UIImage(named: "download2")!),
            ImageSource(image: UIImage(named: "download")!),
            ImageSource(image: UIImage(named: "download2")!),
        ])
    }
    private func setupTableView() {
        itemsTablView.register(UINib.init(nibName:ItemUITablViewCell.identifier , bundle: nil), forCellReuseIdentifier: ItemUITablViewCell.identifier)
        itemsTablView.rowHeight = 300
        itemsTablView.estimatedRowHeight = UITableView.automaticDimension
    }
    private func setupSubscribers() {
        presenter.dataSubject.subscribe({[weak self] event in
            if let element = event.element, let data = element {
                self?.handleScreenState(state: data)
            }
        }).disposed(by: disposable)
    }
    private func handleScreenState(state: HomeScreenState) {
        switch state {
        case .loading: break
        case .success(let data): handleData(items: data)
        case .failure(_): break
        }
    }
    private func handleData(items: [HomeScreenData]) {
        self.items = items
        itemsTablView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemUITablViewCell.identifier) as! ItemUITablViewCell
        cell.configure(item: items[indexPath.row])
            return cell
        }
    }


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
    
    @IBOutlet weak var tableViewTopSpaceConstrains: NSLayoutConstraint!
    @IBOutlet weak var itemsTablView: UITableView!
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
        setupTableView()
        setupSubscribers()
        presenter.fetchData()
        // Do any additional setup after loading the view.
    }
    
    private func setupTableView() {
        itemsTablView.register(UINib.init(nibName:ItemUITablViewCell.identifier , bundle: nil), forCellReuseIdentifier: ItemUITablViewCell.identifier)
        itemsTablView.register(UINib.init(nibName:HeaderView.identifier , bundle: nil), forCellReuseIdentifier: HeaderView.identifier)
        itemsTablView.register(UINib.init(nibName: CategoriesHeaderView.identifier, bundle: nil), forHeaderFooterViewReuseIdentifier: CategoriesHeaderView.identifier)
        itemsTablView.rowHeight = 400
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

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        } else {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CategoriesHeaderView.identifier) as! CategoriesHeaderView
            return headerView
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0 } else {
            return 100
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let headerView = tableView.dequeueReusableCell(withIdentifier: HeaderView.identifier) as! HeaderView
            headerView.cinfigure()
            return headerView} else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ItemUITablViewCell.identifier) as! ItemUITablViewCell
            cell.configure(item: items[indexPath.row], action: {[weak self] in
                guard let self = self else { return }
                self.addItemToCart(item: self.items[indexPath.row] )
            })
            return cell}
    }
    private func addItemToCart(item:HomeScreenData ) {
        
    }
    
}
extension HomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        (itemsTablView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as? HeaderView)?.bottomConstrains.constant = 0.8 * scrollView.contentOffset.y
    }
}

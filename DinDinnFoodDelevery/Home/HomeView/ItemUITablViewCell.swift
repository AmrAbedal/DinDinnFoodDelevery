//
//  ItemUITablViewCell.swift
//  DinDinnFoodDelevery
//
//  Created by Amr AbdelWahab on 10/8/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import UIKit

class ItemUITablViewCell: UITableViewCell {
static let identifier = "ItemUITablViewCell"
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemPriceLabel: UIButton!
    @IBOutlet weak var itemDiscriptionLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(item: HomeScreenData ) {
        itemImageView.image = UIImage.init(named: item.Image)
        itemPriceLabel.setTitle("\(item.price) USD", for: .normal)
    }
}

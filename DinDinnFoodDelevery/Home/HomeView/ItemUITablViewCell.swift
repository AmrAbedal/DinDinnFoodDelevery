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
    var action: (()->())?
    @IBAction func addToCartButtonTap(_ sender: UIButton) {
        action?()
        UIView.animate(withDuration: 0.4, animations: {
            self.itemPriceLabel.isSelected = true
            sender.backgroundColor = #colorLiteral(red: 0.4901960784, green: 0.7607843137, blue: 0.2941176471, alpha: 1)
            sender.isSelected = true
        }, completion: { finished in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
                UIView.animate(withDuration: 0.4, animations: {
            sender.backgroundColor = .black
            sender.isSelected = false
                           })
            })
        })
    }
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemPriceLabel: UIButton!
    @IBOutlet weak var itemDiscriptionLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(item: HomeScreenData,action: @escaping ()->() ) {
        self.action = action
        itemImageView.image = UIImage.init(named: item.Image)
        itemPriceLabel.setTitle("\(item.price) USD", for: .normal)
    }
}

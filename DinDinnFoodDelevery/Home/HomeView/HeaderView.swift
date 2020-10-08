//
//  HeaderView.swift
//  DinDinnFoodDelevery
//
//  Created by Amr AbdelWahab on 10/8/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import UIKit
import ImageSlideshow

class HeaderView: UITableViewCell {
static let identifier = "HeaderView"
    @IBOutlet weak var imageSlideShow: ImageSlideshow!
    @IBOutlet weak var bottomConstrains: NSLayoutConstraint!
    override func awakeFromNib() {
     
    }
    func cinfigure()  {
        imageSlideShow.setImageInputs([
                     ImageSource(image: UIImage(named: "download")!),
                     ImageSource(image: UIImage(named: "download3")!),
                     ImageSource(image: UIImage(named: "download")!),
                     ImageSource(image: UIImage(named: "download3")!),
                 ])
    }
}

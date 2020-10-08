//
//  HeaderView.swift
//  DinDinnFoodDelevery
//
//  Created by Amr AbdelWahab on 10/8/20.
//  Copyright © 2020 Orcas. All rights reserved.
//

import UIKit
import ImageSlideshow

class HeaderView: UITableViewHeaderFooterView {
static let identifier = "HeaderView"
    @IBOutlet weak var imageSlideShow: ImageSlideshow!
    override func awakeFromNib() {
     
    }
    func cinfigure()  {
        imageSlideShow.setImageInputs([
                     ImageSource(image: UIImage(named: "download")!),
                     ImageSource(image: UIImage(named: "download2")!),
                     ImageSource(image: UIImage(named: "download")!),
                     ImageSource(image: UIImage(named: "download2")!),
                 ])
    }
}

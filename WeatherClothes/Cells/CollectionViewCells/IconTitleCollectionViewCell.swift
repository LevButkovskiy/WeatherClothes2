//
//  IconTitleCollectionViewCell.swift
//  WeatherClothes
//
//  Created by Lev Butkovskiy on 20.06.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class IconTitleCollectionViewCell: UICollectionViewCell {

    static let identifier = "iconTitleCell"
    
    @IBOutlet weak var icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor(red: 0.65, green: 0.79, blue: 1.00, alpha: 1.00).cgColor, UIColor(red: 0.34, green: 0.58, blue: 0.98, alpha: 1.00).cgColor]
        gradientLayer.cornerRadius = 8
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.layer.cornerRadius = gradientLayer.cornerRadius
    }

}

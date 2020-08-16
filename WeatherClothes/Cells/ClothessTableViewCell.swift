//
//  ClothessTableViewCell.swift
//  WeatherClothes
//
//  Created by Lev Butkovskiy on 13.06.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class ClothessTableViewCell: UITableViewCell {

    @IBOutlet weak var imageView1 : UIImageView!
    @IBOutlet weak var imageView2 : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

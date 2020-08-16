//
//  ClotheTableViewCell.swift
//  WeatherClothes
//
//  Created by Lev Butkovskiy on 18.06.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class ClotheTableViewCell: UITableViewCell {

    static let identifier = "clotheCell"

    @IBOutlet weak var clotheImage: UIImageView!
    @IBOutlet weak var clotheName: UILabel!
    @IBOutlet weak var clotheType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

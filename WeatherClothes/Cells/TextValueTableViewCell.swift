//
//  TextValueTableViewCell.swift
//  WeatherClothes
//
//  Created by Lev Butkovskiy on 18.06.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class TextValueTableViewCell: UITableViewCell {

    static let identifier = "textValueCell";
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setValues(_ title: String,_ value: String) {
        self.titleLabel.text = title
        self.valueLabel.text = value
    }
    
}

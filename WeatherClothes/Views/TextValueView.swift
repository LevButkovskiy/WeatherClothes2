//
//  TextValueView.swift
//  WeatherClothes
//
//  Created by Lev Butkovskiy on 16.08.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class TextValueView: UIView {
    
    @IBOutlet var contentView: UIView!

    @IBOutlet var textLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("TextValueView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func setValues(_ text: String, _ value: String) {
        self.textLabel.text = text
        self.valueLabel.text = value
    }
}

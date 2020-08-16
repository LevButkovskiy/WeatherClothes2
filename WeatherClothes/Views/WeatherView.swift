//
//  WeatherView.swift
//  WeatherClothes
//
//  Created by Lev Butkovskiy on 16.08.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class WeatherView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var minimumTemperatureLabel: UILabel!

    @IBOutlet weak var windView: TextValueView!
    @IBOutlet weak var humidityView: TextValueView!
    @IBOutlet weak var pressureView: TextValueView!
    @IBOutlet weak var visibilityView: TextValueView!
    
    @IBOutlet weak var headerView: UIView!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("WeatherView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        windView.layer.cornerRadius = 8
        humidityView.layer.cornerRadius = 8
        pressureView.layer.cornerRadius = 8
        visibilityView.layer.cornerRadius = 8
        
        headerView.layer.cornerRadius = 12
        headerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}

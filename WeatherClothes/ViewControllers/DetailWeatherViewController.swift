//
//  DetailWeatherViewController.swift
//  WeatherClothes
//
//  Created by Lev Butkovskiy on 18.06.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class DetailWeatherViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var weatherView: UIView!


    var weatherData: WeatherStruct!

    var weatherTitles: Array<String> = []
    var weatherValues: Array<Any> = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backButtonClick() {
        self.dismiss(animated: true, completion: nil)
    }
}

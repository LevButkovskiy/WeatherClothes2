//
//  HomeViewController.swift
//  WeatherClothes
//
//  Created by Lev Butkovskiy on 13.06.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var weatherView: WeatherView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var minimumTemperatureLabel: UILabel!
    @IBOutlet weak var windTextLabel: UILabel!
    @IBOutlet weak var windValueLabel: UILabel!
    @IBOutlet weak var humidityTextLabel: UILabel!
    @IBOutlet weak var humidityValueLabel: UILabel!
    @IBOutlet weak var pressureTextLabel: UILabel!
    @IBOutlet weak var pressureValueLabel: UILabel!
    @IBOutlet weak var visibilityTextLabel: UILabel!
    @IBOutlet weak var visibilityValueLabel: UILabel!

    var weatherData: WeatherStruct!
    private var dataSource = ["1", "2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: String(describing: ClothessTableViewCell.self), bundle: nil), forCellReuseIdentifier: "clothesCell")
        
        let _ = WeatherAPI(lat: 55.16, lon: 61.4) { (weatherData, error) in
            if(error == nil) {
                let weather = Weather()
                print(weatherData.weather[0].main)
                self.weatherView.cityLabel.text = String(format: "%@, %@", weatherData.name, weatherData.weather[0].description.firstUppercased)
                self.weatherView.temperatureLabel.text = String(format: "%2.f°/", weatherData.main.temp)
                self.weatherView.minimumTemperatureLabel.text = String(format: "%2.f°", weatherData.main.temp_min)
                self.weatherView.windView.setValues(
                    NSLocalizedString("WEATHER_WIND", comment: ""),
                    String(format: "%2.f m/s", weatherData.wind.speed))
                self.weatherView.humidityView.setValues(
                    NSLocalizedString("WEATHER_HUMIDITY", comment: ""),
                    String(format: "%i %@", weatherData.main.humidity, "%"))
                self.weatherView.pressureView.setValues(
                    NSLocalizedString("WEATHER_PRESSURE", comment: ""),
                    String(format: "%2.f mmHg", Double(weatherData.main.pressure) * 0.75006156))
                self.weatherView.visibilityView.setValues(
                    NSLocalizedString("WEATHER_VISIBILITY", comment: ""),
                    String(format: "%i km", Int(Double(weatherData.visibility) / 1000)))
                
                self.weatherData = weatherData
            }
        }
        
        weatherView.layer.shadowColor = UIColor.gray.cgColor
        weatherView.layer.shadowOffset = .zero
        weatherView.layer.shadowOpacity = 0.25
        weatherView.layer.shadowRadius = 16
        weatherView.layer.cornerRadius = 12
        weatherView.layer.masksToBounds = false

        let containerView = UIView(frame: self.tableView.frame)
        containerView.backgroundColor = .clear
        containerView.layer.shadowColor = UIColor.gray.cgColor
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowOpacity = 0.25
        containerView.layer.shadowRadius = 16
        
        tableView.layer.cornerRadius = 12
        tableView.layer.masksToBounds = true

        self.view.addSubview(containerView)
        containerView.addSubview(tableView)

        //self.tableView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        let pressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handlePress(sender:)))
        weatherView.addGestureRecognizer(pressGestureRecognizer)
        
    }

//MARK: UITableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "clothesCell", for: indexPath) as! ClothessTableViewCell
        if(indexPath.row == 0){
            cell.imageView1.image = UIImage(named: "image1")
            cell.imageView2.image = UIImage(named: "image2")
        }
        else{
            cell.imageView1.image = UIImage(named: "image3")
            cell.imageView2.image = UIImage(named: "image4")
        }
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 2
    }
    
    @IBAction func detailButtonClick() {
        let controller = DetailWeatherViewController()
        controller.weatherData = self.weatherData
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func tappedWeather() {
//        self.weatherView.backgroundColor = .lightGray
    }
    
    @IBAction func longPressedWeather() {
        UIView.animate(withDuration: 0.3, animations: {
            self.weatherView.contentView.backgroundColor = .lightGray
        }) { (completion) in
            let controller = DetailWeatherViewController()
            controller.weatherData = self.weatherData
            self.present(controller, animated: true, completion: nil)
            self.weatherView.contentView.backgroundColor = .white
        }
    }
    
    @objc func handlePress(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            UIView.animate(withDuration: 0.4, animations: {
                self.weatherView.backgroundColor = .lightGray
            }) { (completion) in
                let controller = DetailWeatherViewController()
                controller.weatherData = self.weatherData
                self.present(controller, animated: true, completion: nil)
                self.weatherView.backgroundColor = .white
            }
        }
        else if sender.state == .ended {
            self.weatherView.contentView.backgroundColor = .white
        }
    }
}

extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}

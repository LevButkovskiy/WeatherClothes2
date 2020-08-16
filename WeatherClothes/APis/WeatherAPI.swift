//
//  WeatherAPI.swift
//  WeatherClothes
//
//  Created by Lev Butkovskiy on 18.06.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit
import Alamofire

struct WeatherStruct: Codable {
    let base: String
    struct Clouds: Codable {
        let all: Float
    }
    let clouds: Clouds
    let cod: Int
    struct Coord: Codable {
        let lat: Float
        let lon: Float
    }
    let coord: Coord
    let dt: Int
    let id: Int
    struct Main: Codable {
        let feels_like: Float
        let humidity: Int
        let pressure: Int
        let temp: Float
        let temp_max: Float
        let temp_min: Float
    }
    let main: Main
    let name: String
    struct Sys: Codable {
        let country: String
        let sunrise: Int
        let sunset: Int
    }
    let sys: Sys
    let timezone: Int
    let visibility: Int
    struct Weather: Codable {
        let description: String
        let icon: String
        let id: Int
        let main: String
    }
    let weather: [Weather]
    struct Wind: Codable {
        let deg: Int
        let speed: Float
    }
    let wind: Wind
}

class WeatherAPI: NSObject {
    private static let openWeatherMapAPIKey = "06db44f389d2172e9b1096cdce7b051c"
    private static let APPID = "be1791235ccb226035fc36eae1293677"
    
    init(lat: Double, lon: Double, completion: @escaping(_ result: WeatherStruct, _ error: Error?) -> Void) {
        super.init()
        
        let query = String(format: "https://api.openweathermap.org/data/2.5/weather?lat=%.2f&lon=%.2f&APPID=%@&units=metric&lang=%@", lat, lon, WeatherAPI.APPID, NSLocalizedString("LANGUAGE", comment: "Weather API"))
        
        let request = AF.request(query)
        
        request.responseJSON { (response) in
            print("> WEATHER API:", response)
            let decoder = JSONDecoder()
            let result = try! decoder.decode(WeatherStruct.self, from: response.data!)
            
            completion(result, nil)
        }
    }
}

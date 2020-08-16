//
//  Weather.swift
//  WeatherClothes
//
//  Created by Lev Butkovskiy on 19.06.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class Weather: NSObject {
    func imageForIconName(_ name: String) -> UIImage?{
        let time = name[name.length - 1]
        let timeStr = time == "d" ? "Day" : "Night"
        let iconNumber = name.substring(toIndex: name.length - 1)
        var imageStr = ""
        
        switch iconNumber {
            case "01": imageStr = "Clear"
            case "02": imageStr = "PartyCloudy"
            case "03": imageStr = "Cloudy"
            case "04": imageStr = "Cloudy"
            case "09": imageStr = "LightRain"
            case "10": imageStr = "HeavyRain"
            case "11": imageStr = "Thunderstorm"
            case "13": imageStr = "Snow"
            case "50": imageStr = "Smoke"
        default:
            return nil
        }
        return UIImage(named: String(format: "%@%@", imageStr, timeStr))
    }
}

extension String {
    var length: Int {
        return count
    }
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

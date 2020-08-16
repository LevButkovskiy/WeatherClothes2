//
//  Clothe.swift
//  WeatherClothes
//
//  Created by Lev Butkovskiy on 18.06.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class Clothe: NSObject {

    var name: String!
    var image: UIImage?
    var type: String!
    
    init(name: String!, image: UIImage?, type: String!) {
        self.name = name
        self.image = image ?? nil
        self.type = type
    }
}

//
//  TabBarController.swift
//  WeatherClothes
//
//  Created by Lev Butkovskiy on 13.06.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.isHidden = true
        
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(
            title: NSLocalizedString("VC_HOME_TITLE",
            comment: "HomeViewController title"),
            image: UIImage(named: "homeTabBarIcon"),
            tag: 0)
        
        let recomendationViewController = RecomendationViewController()
        recomendationViewController.tabBarItem = UITabBarItem(
        title: NSLocalizedString("VC_RECOMENDATION_TITLE",
        comment: "RecomendationViewController title"),
        image: UIImage(named: "recomendationTabBarIcon"),
        tag: 1)
        
        let wardrobeViewController = WardrobeViewController()
        wardrobeViewController.tabBarItem = UITabBarItem(
        title: NSLocalizedString("VC_WARDROBE_TITLE",
        comment: "WardrobeViewController title"),
        image: UIImage(named: "wardrobeTabBarIcon"),
        tag: 2)
        
        let trendsViewController = TrendsViewController()
        trendsViewController.tabBarItem = UITabBarItem(
        title: NSLocalizedString("VC_TRENDS_TITLE",
        comment: "TrendsViewController title"),
        image: UIImage(named: "trendsTabBarIcon"),
        tag: 3)
        
        let profileViewController = TrendsViewController()
        profileViewController.tabBarItem = UITabBarItem(
        title: NSLocalizedString("VC_PROFILE_TITLE",
        comment: "ProfileViewController title"),
        image: UIImage(named: "profileTabBarIcon"),
        tag: 4)

        
        let tabBarList = [homeViewController, recomendationViewController, wardrobeViewController, trendsViewController, profileViewController]
        self.viewControllers = tabBarList
        // Do any additional setup after loading the view.
    }
}

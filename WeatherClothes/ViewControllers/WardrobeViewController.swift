//
//  WardrobeViewController.swift
//  WeatherClothes
//
//  Created by Lev Butkovskiy on 13.06.2020.
//  Copyright © 2020 BlueBeakStd. All rights reserved.
//

import UIKit

class WardrobeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    private var inventory : Array<Clothe>!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        tableView.register(UINib(nibName: String(describing: ClotheTableViewCell.self), bundle: nil), forCellReuseIdentifier: ClotheTableViewCell.identifier)

        setTextToLabels()
        initInventory()
    }
    
    func setTextToLabels(){
        self.titleLabel.text = NSLocalizedString("VC_WARDROBE_TITLE", comment: "WardrobeVC title")
    }
    
    func initInventory() {
        self.inventory = [Clothe(name: "Футболка", image: nil, type: "Верхняя часть одежды"), Clothe(name: "Штаны", image: nil, type: "Нижняя часть одежды")]
    }

//MARK: UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ClotheTableViewCell.identifier, for: indexPath) as! ClotheTableViewCell
        let clothe = inventory[indexPath.row]
        cell.clotheName.text = clothe.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.frame.height / 5;
    }
}

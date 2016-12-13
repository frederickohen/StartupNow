//
//  StartupDetailViewController.swift
//  StartupNow
//
//  Created by Fredrick Ohen on 12/6/16.
//  Copyright © 2016 geeoku. All rights reserved.
//

import UIKit

class StartupDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var marketLabel: UILabel!
    @IBOutlet weak var foundersLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var productInfoLabel: UILabel!
    
    var name = String ()
    var selectedStartup: Startup!
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedStartup.name
        marketLabel.text = selectedStartup.market
        foundersLabel.text = selectedStartup.founders
        locationLabel.text = selectedStartup.location
        websiteLabel.text = selectedStartup.website
        productInfoLabel.text = selectedStartup.productInfo
        self.title = selectedStartup.name

    }
}

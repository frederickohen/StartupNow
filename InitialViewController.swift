//
//  InitialTableViewController.swift
//  StartupNow
//
//  Created by Fredrick Ohen on 11/29/16.
//  Copyright © 2016 geeoku. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()

    transparentNavBar()
  }
  
  func transparentNavBar() {
    let navBar = self.navigationController?.navigationBar
    navBar?.setBackgroundImage(UIImage(), for: .default)
    navBar?.shadowImage = UIImage()
    navBar?.isTranslucent = true
  }
}

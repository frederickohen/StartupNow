//
//  StartupListTableViewController.swift
//  StartupNow
//
//  Created by Fredrick Ohen on 12/4/16.
//  Copyright © 2016 geeoku. All rights reserved.
//

import UIKit
import FirebaseDatabase

class StartupListTableViewController: UITableViewController {
    
    var databaseRef: FIRDatabaseReference!
    var startups = [Startup]()

    override func viewDidLoad() {
        super.viewDidLoad()

        databaseRef = FIRDatabase.database().reference().child("startups")
        databaseRef.observe(.value, with: {snapshot in

        var newStartups: [Startup] = []
            
            for startup in snapshot.children {
                
            let newStartup = Startup(snapshot: startup as! FIRDataSnapshot)
                newStartups.append(newStartup)
              }
            
            self.startups = newStartups
            self.tableView.reloadData()
    })
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return startups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StartupCell", for: indexPath)
        
        let newStartups = startups[indexPath.row]
        
        cell.textLabel?.text = newStartups.name
        cell.detailTextLabel?.text = newStartups.market

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "DetailSegue" {
            let indexPath = tableView.indexPathForSelectedRow
            let selectedRowIndex = (indexPath?.row)
            let selectedStartup = startups[selectedRowIndex!]
            
            let startupDetailVC = segue.destination as! StartupDetailViewController
            startupDetailVC.selectedStartup = selectedStartup
        }
    }
}

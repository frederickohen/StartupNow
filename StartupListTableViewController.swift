//
//  StartupListTableViewController.swift
//  StartupNow
//
//  Created by Fredrick Ohen on 12/4/16.
//  Copyright © 2016 geeoku. All rights reserved.
//

import UIKit
import Social
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
        return 2
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

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }

    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
       
        //var startups = [Startup]()
        


        let shareAction = UITableViewRowAction(style: .normal, title: "Share") { (action: UITableViewRowAction, IndexPath) -> Void in
 
            //let newStartups = startups[indexPath.row]
            //self.startups = [newStartups]
            //let startupWebsite = newStartups.website
            
            let string: String = "Checkout this cool startup!\("www.geeoku.com") "

            let firstActivityItem = self.startups[indexPath.row]

            let activityViewController = UIActivityViewController(activityItems: [firstActivityItem,string], applicationActivities: nil)
            
            self.present(activityViewController, animated: true, completion: nil)
       

        }
        
        let customOrange = UIColor(red: 209/225, green: 87/225, blue: 39/225, alpha: 1)
        shareAction.backgroundColor = customOrange
        return[shareAction]
     
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

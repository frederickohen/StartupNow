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
 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let newStartup = startups[indexPath.row]
            newStartup.databaseRef?.removeValue()
            self.tableView.reloadData()
        }    
    }
    
    */
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

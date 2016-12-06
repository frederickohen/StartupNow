//
//  StartupInfoViewController.swift
//  StartupNow
//
//  Created by Fredrick Ohen on 11/29/16.
//  Copyright © 2016 geeoku. All rights reserved.
//

import UIKit
import FirebaseDatabase

class StartupInfoViewController: UIViewController {

   
    @IBOutlet weak var startupNameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var marketTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var foundersTextField: UITextField!
    @IBOutlet weak var productTextView: UITextView!
    
    var databaseRef: FIRDatabaseReference!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        databaseRef = FIRDatabase.database().reference().child("startups")

    }

    @IBAction func saveButtonPressed() {
       // TODO: Post data to Firebase
       
        sendDataToFirebaseDB()
        self.dismiss(animated: true, completion: nil)
   
    }
    
    func sendDataToFirebaseDB () {
        // Sends data from textfield to Firebase database
        let startupAttributes = Startup(name: startupNameTextField.text!, location: locationTextField.text!, market: marketTextField.text!, website: websiteTextField.text!, founders: foundersTextField.text!, productInfo: productTextView.text)
        
        let startupAttributesRef = self.databaseRef.child(startupNameTextField.text!)
        startupAttributesRef.setValue(startupAttributes.toAnyObject())
 
        }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

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
        
       // let logo = UIImage(named: "logo")
//        let imageView = UIImageView(image: #imageLiteral(resourceName: "logo"))
//        self.navigationItem.titleView = imageView
        

        databaseRef = FIRDatabase.database().reference().child("startups")
    }
    
    @IBAction func saveButtonPressed() {
       // TODO: Post data to Firebase
       
        sendDataToFirebaseDB()
        self.dismiss(animated: true, completion: nil)
    }
    
    func sendDataToFirebaseDB () {
       
        if (startupNameTextField.text?.isEmpty)!  {
            let alertController = UIAlertController(title: "Invalid entry", message: "Please fill out data", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        } else {
            print("**************error*************")
        }
        
        // Sends data from textfield to Firebase database

        let startupAttributes = Startup(name: startupNameTextField.text!, location: locationTextField.text!, market: marketTextField.text!, website: websiteTextField.text!, founders: foundersTextField.text!, productInfo: productTextView.text)

        let startupAttributesRef = self.databaseRef.childByAutoId()
        startupAttributesRef.setValue(startupAttributes.toAnyObject())
 
        }
}

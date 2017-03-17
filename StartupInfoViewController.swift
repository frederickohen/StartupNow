//
//  StartupInfoViewController.swift
//  StartupNow
//
//  Created by Fredrick Ohen on 11/29/16.
//  Copyright © 2016 geeoku. All rights reserved.
//

import UIKit
import Firebase

class StartupInfoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var startupNameTextField: UITextField!
  @IBOutlet weak var locationTextField: UITextField!
  @IBOutlet weak var marketTextField: UITextField!
  @IBOutlet weak var websiteTextField: UITextField!
  @IBOutlet weak var foundersTextField: UITextField!
  @IBOutlet weak var productTextView: UITextView!
  @IBOutlet weak var startupLogoImageView: UIImageView!
  
  var databaseRef: FIRDatabaseReference!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    databaseRef = FIRDatabase.database().reference().child("startups")
  }
  
  @IBAction func saveButtonPressed() {

    sendDataToFirebaseDB()
    self.dismiss(animated: true, completion: nil)
  }
  
  @IBAction func uploadPhotoButtonPressed() {
    
    let imagePicker = UIImagePickerController()
    imagePicker.delegate = self
    imagePicker.sourceType = .photoLibrary
    imagePicker.allowsEditing = true
    self.present(imagePicker, animated: true, completion: nil)
    print("Photo button pressed")
    
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
    let image = info[UIImagePickerControllerOriginalImage] as? UIImage
      self.startupLogoImageView.image = image
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
                startupLogoImageView.image = image
        } else if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
                startupLogoImageView.image = image
          } else {
                startupLogoImageView.image = nil
            }
    self.dismiss(animated: false, completion: nil)
  }

  func sendDataToFirebaseDB () {
    
    if (startupNameTextField.text?.isEmpty)!  {
      let alertController = UIAlertController(title: "Invalid entry", message: "Please fill out data", preferredStyle: .alert)
      
      let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
      alertController.addAction(defaultAction)
      
      present(alertController, animated: true, completion: nil)
    } else {
      print("Text field entries satisfied")
    }
    
    let startupAttributes = Startup(name: startupNameTextField.text!, location: locationTextField.text!, market: marketTextField.text!, website: websiteTextField.text!, founders: foundersTextField.text!, productInfo: productTextView.text)
    
    let startupAttributesRef = self.databaseRef.childByAutoId()
    startupAttributesRef.setValue(startupAttributes.toAnyObject())
    
  }
}

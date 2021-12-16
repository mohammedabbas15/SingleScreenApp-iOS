//
//  ViewController.swift
//  Single Screen App
//
//  Created by sherriff on 9/9/16.
//  Copyright © 2016 Mark Sherriff. All rights reserved.
//
// commit, push and pull
// remove white space

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.delegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func acceptValues(_ sender: UIButton) {
        
        if nameField.text != nil {
            
            var name = nameField.text!
            let date = datePicker.date
            
            if name == "" {
                name = "Unknown"
            }
        
            let alertController = UIAlertController(title: "Hi, " + name + "!", message: "You picked " + date.description, preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
        }
    }

}


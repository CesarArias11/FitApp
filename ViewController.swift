//
//  ViewController.swift
//  FitApp
//
//  Created by Edson Vaz on 11/12/18.
//  Copyright © 2018 Edson Vaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    var height : Double?
    var weight : Double?
    let userDefaults = UserDefaults.standard
    var hasAddedHeight = false
    var hasAddedWeight = false
    
    override func viewDidLoad() {
        self.hideKeyboardWhenScreenIsTapped()
    }

    @IBAction func startTapped(_ sender: Any) {
        
        if let unwrappedHeight = heightField.text?.double {
            height = Double(unwrappedHeight)
            userDefaults.set(height, forKey: "myHeight")
            hasAddedHeight = true
        }
        
        if let unwrappedWeight = weightField.text?.double {
            weight = Double(unwrappedWeight)
            userDefaults.set(weight, forKey: "myWeight")
            hasAddedWeight = true
        }
        
        if hasAddedHeight && hasAddedWeight {
            userDefaults.set(true, forKey: "hasAddedData")
            performSegue(withIdentifier: "toActivity", sender: self)
        } else {
            displayAlert(title: "Not doubles.", message: "You have to enter doubles.", actionTitle: "OK")
        }
        
    }
    
}

extension StringProtocol {
    var double : Double? {
        return Double(self)
    }
}

extension UIViewController {
    
    func hideKeyboardWhenScreenIsTapped() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func displayAlert(title: String, message: String, actionTitle: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
}

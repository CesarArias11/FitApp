//
//  SettingsViewController.swift
//  FitApp
//
//  Created by Edson Vaz on 11/12/18.
//  Copyright © 2018 Edson Vaz. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    var myHeight : Double?
    var myWeight : Double?
    let userDefaults = UserDefaults.standard
    var height : Double?
    var weight : Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        height = userDefaults.double(forKey: "myHeight")
        weight = userDefaults.double(forKey: "myWeight")
        heightField.text = String(format: "%.2f", height!)
        weightField.text = String(format: "%.2f", weight!)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        if let unwrappedheight = heightField.text?.double {
            myHeight = unwrappedheight
            userDefaults.set(myHeight, forKey: "myHeight")
        }
        
        if let unwrappedWeight = weightField.text?.double {
            myWeight = unwrappedWeight
            userDefaults.set(myWeight, forKey: "myWeight")
        }
        
    }
    
}

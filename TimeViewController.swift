//
//  TimeViewController.swift
//  FitApp
//
//  Created by Gerardo Becerril on 11/12/18.
//  Copyright © 2018 Gerardo Glz. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {

    @IBOutlet weak var timeField: UITextField!
    var selectedMET : Double?
    var time : Double?
    
    override func viewDidLoad() {
        self.hideKeyboardWhenScreenIsTapped()
    }
    
    @IBAction func calculateTapped(_ sender: Any) {
        
        if let unwrappedTime = timeField.text?.double {
            time = Double(unwrappedTime)
            performSegue(withIdentifier: "toCalories", sender: self)
        } else {
            displayAlert(title: "Not a double", message: "It must be a double, buddy.", actionTitle: "OK")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let caloriesVC = segue.destination as? CaloriesViewController
        caloriesVC?.myTime = time
        caloriesVC?.myMET = selectedMET
        caloriesVC?.previousVC = self
        
    }
    
}

//
//  CaloriesViewController.swift
//  FitApp
//
//  Created by Gerardo Becerril on 11/12/18.
//  Copyright © 2018 Gerardo Glz. All rights reserved.
//

import UIKit

class CaloriesViewController: UIViewController {

    @IBOutlet weak var caloriesLabel: UILabel!
    var myTime : Double?
    var myWeight : Double?
    var myCalories : Double?
    var myMET : Double?
    var previousVC = TimeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myWeight = UserDefaults.standard.double(forKey: "myHeight")
        myCalories = Double(myTime!) * Double(myWeight!) * Double(myMET!)
        caloriesLabel.text = "You have burned " + String(format: "%.2f", myCalories!) + " calories."
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        previousVC.navigationController?.popViewController(animated: true)
    }
    
}

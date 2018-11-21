//
//  ActivitiesViewController.swift
//  FitApp
//
//  Created by Edson Vaz on 11/12/18.
//  Copyright © 2018 Edson Vaz All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    var met : Double?
    
    @IBAction func activitiesTapped(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            met = 2.95
        case 1:
            met = 8.2
        case 2:
            met = 4.525
        case 3:
            met = 6.7
        default:
            print("Error")
        }
        
        performSegue(withIdentifier: "toTime", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let timeVC = segue.destination as? TimeViewController {
            timeVC.selectedMET = met
        }
        
        if segue.destination is SettingsViewController {
            let backButton = UIBarButtonItem()
            backButton.title = "Home"
            navigationController?.navigationBar.backItem?.backBarButtonItem = backButton
        }
        
    }

}

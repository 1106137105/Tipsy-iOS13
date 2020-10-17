//
//  ResultViewController.swift
//  Tipsy
//
//  Created by 溫家豪 on 2020/10/17.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var tipValue : Float?
    var splitValue : Float?
    var billValue : Float?
    var answer : Float?
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(answer!)
        if tipValue == 0 {
            settingsLabel.text = "Split between  \(Int(splitValue!))  people, with 0% up"
        }else if tipValue == 0.1{
            settingsLabel.text = "Split between  \(Int(splitValue!))  people, with 10% up"
        }else if tipValue == 0.2{
            settingsLabel.text = "Split between  \(Int(splitValue!))  people, with 20% up"
        }

        
        
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}

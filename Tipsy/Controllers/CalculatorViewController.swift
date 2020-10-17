//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var tipValue : Float!
    var splitValue : Float!
    var billValue : Float!
    var answer : Float!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var textPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func tipChanged(_ sender: UIButton) {
        if sender.currentTitle! == "0%" {
            zeroPctButton.isSelected = true
            textPctButton.isSelected = false
            twentyPctButton.isSelected = false
            tipValue = 0.0
        }else if sender.currentTitle! == "10%"{
            zeroPctButton.isSelected = false
            textPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tipValue = 0.1
        }else{
            zeroPctButton.isSelected = false
            textPctButton.isSelected = false
            twentyPctButton.isSelected = true
            tipValue = 0.2
        }
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        splitValue = Float(sender.value)
    }
    
    @IBAction func billValueChanged(_ sender: UITextField) {
        billValue = Float(sender.text!)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        answer = billValue! * (1 + tipValue!) / splitValue!
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.tipValue = tipValue
            destinationVC.splitValue = splitValue
            destinationVC.billValue = billValue
            destinationVC.answer = answer
        }
    }
    

}


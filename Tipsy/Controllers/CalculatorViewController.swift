//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButon: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var billPerPerson: Double = 0
    var personCount: Int = 0
    var tipPct: Int = 0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        if sender.tag == 0{
            tenPctButton.isSelected = false
            twentyPctButon.isSelected = false
        }
        else if sender.tag == 1{
            zeroPctButton.isSelected = false
            twentyPctButon.isSelected = false
        }
        else{
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
        }
        
        sender.isSelected = true
        
        hideKeyboard()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        hideKeyboard()
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        hideKeyboard()
        let rawBill: Double  = Double((billTextField.text!).replacingOccurrences(of: ",", with: "."))!
        var totalBill: Double
        personCount = Int(splitNumberLabel.text!)!
        
        if zeroPctButton.isSelected{
            tipPct = 0
        }
        else if tenPctButton.isSelected{
            tipPct = 10
        }
        else{
            tipPct = 20
        }
        
        totalBill = Double (rawBill + rawBill * Double((tipPct / 100)))

        billPerPerson = totalBill / Double(personCount)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
                    
            let destinationVC = segue.destination as! ResultsViewController
                    
            destinationVC.result = String(format: "%.2f", billPerPerson)
            destinationVC.tip = tipPct
            destinationVC.split = personCount
        }
    }
    
    func hideKeyboard(){
        billTextField.endEditing(true)
    }
}

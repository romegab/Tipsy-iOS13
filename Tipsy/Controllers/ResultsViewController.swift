//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Ivan Stoilov on 15.08.21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result: String = "0.0"
    var tip: Int = 10
    var split: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = result
               settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
}

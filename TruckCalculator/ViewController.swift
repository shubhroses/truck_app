//
//  ViewController.swift
//  TruckCalculator
//
//  Created by shubhrose singh on 12/23/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalPayTextEntry: UITextField!
    @IBOutlet weak var milesDrivenTextEntry: UITextField!
    @IBOutlet weak var netProfitLabel: UILabel!
    @IBOutlet weak var ratePerMileLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func calculateOutput(_ sender: Any) {
        // Compute netProfit
        if let totalPayText = totalPayTextEntry.text, let milesDrivenText = milesDrivenTextEntry.text{
            if let totalPay = Int(totalPayText), let milesDriven = Int(milesDrivenText){
                netProfitLabel.text = "$\(totalPay+milesDriven)"
                
            }
        }
        
        // Compute ratePerMile
        if let totalPayText = totalPayTextEntry.text, let milesDrivenText = milesDrivenTextEntry.text{
            if let totalPay = Int(totalPayText), let milesDriven = Int(milesDrivenText){
                ratePerMileLabel.text = "$\(totalPay-milesDriven)"
                
            }
        }
    }
    
}


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
    @IBOutlet weak var fixedCostTextEntry: UITextField!
    @IBOutlet weak var costOfFuelTextEntry: UITextField!
    @IBOutlet weak var driverCostLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let toolBar = UIToolbar()
        
        toolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        totalPayTextEntry.inputAccessoryView = toolBar
        milesDrivenTextEntry.inputAccessoryView = toolBar
    }
    
    @objc func doneClicked(){
        view.endEditing(true)
    }


    @IBAction func calculateOutput(_ sender: Any) {
        // Compute netProfit
        var driverCost = Int()
        if let milesDrivenText = milesDrivenTextEntry.text{
            if let milesDriven = Int(milesDrivenText){
                if (milesDriven < 200){
                    driverCost = 150
                }
                else if (milesDriven >= 200 && milesDriven < 260){
                    driverCost = 175
                }
                else{
                    driverCost = 200
                }
                driverCostLabel.text = "$\(driverCost)"
            }
        }
        var fuelCost = Int()
        if let milesDrivenText = milesDrivenTextEntry.text, let costOfFuelText = costOfFuelTextEntry.text{
            if let milesDriven = Int(milesDrivenText), let costOfFuel = Int(costOfFuelText){
                fuelCost = milesDriven * costOfFuel
            }
        }
        
        if let fixedCostText = fixedCostTextEntry.text,
            let totalPayText = totalPayTextEntry.text{
            if let fixedCost = Int(fixedCostText), let totalPay = Int(totalPayText){
                let profit = totalPay - fixedCost - fuelCost - driverCost
                netProfitLabel.text = "$\(profit)"
            }
        }
        
        
        // Compute ratePerMile
        if let totalPayText = totalPayTextEntry.text, let milesDrivenText = milesDrivenTextEntry.text{
            if let totalPay = Int(totalPayText), let milesDriven = Int(milesDrivenText){
                ratePerMileLabel.text = "$\(totalPay-milesDriven)"
                ratePerMileLabel.text = "$\(totalPay/milesDriven)"
                
            }
        }

    }
    
}


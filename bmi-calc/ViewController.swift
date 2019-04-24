//
//  ViewController.swift
//  bmi-calc
//
//  Created by Ilyasa Azmi on 24/04/19.
//  Copyright © 2019 Ilyasa Azmi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var indicatorLbl: UILabel!
    
    var weight: Float = 0.0, height: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func weightSliderChangedValue(_ sender: UISlider) {
        changeLabel(label: weightLabel, value: sender.value, satuan: "kg")
        weight = sender.value
        calculateBMI()
    }
    
    @IBAction func heightSliderChangedValue(_ sender: UISlider) {
        changeLabel(label: heightLabel, value: sender.value, satuan: "m")
        height = sender.value
        calculateBMI()
    }
    
    @IBAction func segmentedChangedValue(_ sender: UISegmentedControl) {
        view.backgroundColor = sender.selectedSegmentIndex == 0 ? UIColor.white : UIColor.gray
    }
    
    private func changeLabel(label: UILabel, value: Float, satuan: String){
        label.text = "\(value) \(satuan)"
    }
    
    private func calculateBMI(){
        if weight != 0 && height != 0 {
            let bmi = weight / (height * height)
            
            changeLabel(label: bmiLabel, value: bmi, satuan: "Kg/m2")
            
            if bmi < 18.5 {
                changeIndicatorLabel(indicator: "Underweight", color: .yellow)
            } else if bmi >= 18.5 && bmi <= 24.9 {
                changeIndicatorLabel(indicator: "Normal", color: .green)
            } else if bmi >= 25 && bmi <= 29.9 {
                changeIndicatorLabel(indicator: "Overweight", color: .yellow)
            } else if bmi >= 30 {
                changeIndicatorLabel(indicator: "Obesity", color: .red)
            }
        }
    }
    
    private func changeIndicatorLabel(indicator: String, color: UIColor){
        indicatorLbl.text = indicator
        indicatorLbl.textColor = color
    }
}


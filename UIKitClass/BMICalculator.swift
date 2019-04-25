//
//  BMICalculator.swift
//  UIKitClass
//
//  Created by Azis Jabbar Susetio on 24/04/19.
//  Copyright © 2019 Azis Susetio. All rights reserved.
//

import UIKit

class BMICalculator: UIViewController{
    var height:Float = 0
    var weight:Float = 0
    var bmi:Float = 0
    var darkMode = 0
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var bmiScoreLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var darkModeSegmentedControl: UISegmentedControl!
    @IBOutlet var labels: [UILabel]!
    
    
    @IBAction func darkModeUISegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            view.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
            for label in labels{
                label.textColor = UIColor.white
                darkMode = 1
            }
        default:
            view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            for label in labels{
                label.textColor = UIColor.black
                darkMode = 0
            }
            
        }
        setNeedsStatusBarAppearanceUpdate()
        
    }
    
    @IBAction func weightSlider(_ sender: UISlider) {
        weightLabel.text = String(format: "%.1f kg", sender.value)
        weight = sender.value
        countBMI(kg: weight, m: height)
        
    }
    
    @IBAction func heightSlider(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f m", sender.value)
        height = sender.value
        countBMI(kg: weight, m: height)
    }
    
    func countBMI(kg:Float, m:Float)  {
        let bmi = kg/(m*m)
        bmiScoreLabel.text = String(format: "%.1f kg/m2", bmi)
        
        switch bmi {
        case 0...18,5:
            statusLabel.text = "Underweight"
            statusLabel.textColor = #colorLiteral(red: 1, green: 0.8784313725, blue: 0.07843137255, alpha: 1)
        case 18,05...25:
            statusLabel.text = "Normal"
            statusLabel.textColor = #colorLiteral(red: 0.2352941176, green: 1, blue: 0.3333333333, alpha: 1)
        case 25...30:
            statusLabel.text = "Overweight"
            statusLabel.textColor = #colorLiteral(red: 1, green: 0.662745098, blue: 0.07843137255, alpha: 1)
        default:
            statusLabel.text = "Obese"
            statusLabel.textColor = #colorLiteral(red: 1, green: 0.3098039216, blue: 0.2666666667, alpha: 1)
        }
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        switch darkMode {
        case 1:
            return .lightContent
        default:
            return .default
        }
    }
    

}

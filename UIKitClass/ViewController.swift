//
//  ViewController.swift
//  UIKitClass
//
//  Created by Azis Jabbar Susetio on 24/04/19.
//  Copyright © 2019 Azis Susetio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var addToAppleWalletButton: UIButton!
    @IBOutlet weak var descriptionInformationLabel: UILabel!
    @IBOutlet weak var vallueLabel: UILabel!
    @IBOutlet weak var valueProgress: UIProgressView!
    @IBOutlet weak var curPagesView: UIPageControl!
    @IBOutlet weak var loadingActivityIndicator: UIActivityIndicatorView!
    
    var a:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addToAppleWalletButton.layer.cornerRadius = 15
        addToAppleWalletButton.layer.masksToBounds = true
    }

    @IBAction func addToAppleWalletDidTap(_ sender: Any) {
        print("wadaw")
        addToAppleWalletButton.setTitle("Added", for: .normal)
        
    }
    
    @IBAction func valueSlider(_ sender: UISlider) {
        vallueLabel.text = String(Int(sender.value))
        
        
        
        valueProgress.progress = 1 - Float(sender.value)/100
    }
    
    @IBAction func valueStepper(_ sender: UIStepper) {
        vallueLabel.text = String(Int(sender.value))
        
    }
    
    @IBAction func valueSwitch(_ sender: UISwitch) {
        if sender.isOn{
            vallueLabel.text = "ON"
            
        }else{
            vallueLabel.text = "OFF"
        }
    }
    
    @IBAction func valueUISegmentControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            valueProgress.progress = 0.3
            vallueLabel.text = "First"
            curPagesView.currentPage = 0
        case 1:
            valueProgress.progress = 0.6
            vallueLabel.text = "Second"
            curPagesView.currentPage = 1
        case 2:
            valueProgress.progress = 1
            vallueLabel.text = "Third"
            curPagesView.currentPage = 2
        default:
            vallueLabel.text = "none"
            
        }
    }
    
}


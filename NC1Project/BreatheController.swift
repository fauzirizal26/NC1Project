//
//  ViewController.swift
//  NC1Project
//
//  Created by Fauzi Rizal on 16/05/19.
//  Copyright © 2019 Fauzi Rizal. All rights reserved.
//

import UIKit

class BreatheController: UIViewController {
    
    // outlets
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var ovalOutlet: UIImageView!
    
    
    // variables
    var clickedButton: Bool = true
    var timer: Timer?
    var status = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse, .repeat], animations: {
            self.ovalOutlet.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }, completion: nil)
    }
    
    
    @objc func gantiLabel() {
        if status == 1 {
            instructionLabel.text = "Breathe out"
            status = 2
        } else {
            instructionLabel.text = "Breathe in"
            status = 1
        }
    }

    @IBAction func animateButton(_ sender: UIButton) {
        if clickedButton == true {
            timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(gantiLabel), userInfo: nil, repeats: true)
            UIView.animate(withDuration: 3, delay: 0, options: [.autoreverse, .repeat], animations:{
                self.ovalOutlet.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
                self.instructionLabel.text = "Breathe in"
                self.clickedButton = false
            })
        } else {
            ovalOutlet.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            
            timer?.invalidate()

            UIView.animate(withDuration: 0.5, delay: 0, options: [.autoreverse, .repeat], animations: {
                self.ovalOutlet.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                self.clickedButton = true
                self.instructionLabel.text = ""
                
            })
        }
    }
    
}


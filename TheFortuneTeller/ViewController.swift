//
//  ViewController.swift
//  TheFortuneTeller
//
//  Created by Alex Lopez on 28/09/2018.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelAnswer: UILabel!
    @IBOutlet weak var askButton: UIButton!
    
    let answersArray : [String] = ["Yes", "No", "Can be", "Ask again", "I have no idea", "Don`t even dream about it"]
    let answrsArrayLength : UInt32
    
    required init?(coder aDecoder: NSCoder) {
        self.answrsArrayLength = UInt32(self.answersArray.count)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelAnswer.text = ""
        
        //Dynamically changing font size of UILabel
        self.labelAnswer.numberOfLines = 1
        self.labelAnswer.adjustsFontSizeToFitWidth = true
    }

    @IBAction func askButtonPressed(_ sender: Any) {
        self.labelAnswer.text = self.answersArray[Int(arc4random_uniform(self.answrsArrayLength))]
    }
    
}


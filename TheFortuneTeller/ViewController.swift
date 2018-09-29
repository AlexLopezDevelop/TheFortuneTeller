//
//  ViewController.swift
//  TheFortuneTeller
//
//  Created by Alex Lopez on 28/09/2018.
//  Copyright © 2018 Cristian Lopez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var labelAnswer: UILabel!
    @IBOutlet weak var askButton: UIButton!
    
    let answersArray : [String] = ["Yes", "No", "Can be", "Ask again", "I have no idea", "Don`t even dream about it"]
    let answrsArrayLength : UInt32
    
    var songPlayer = AVAudioPlayer()
    
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
        
        prepareSongAndSession()
    }

    @IBAction func askButtonPressed(_ sender: Any) {
        generateAnswer()
    }
    
    //Shake implementation
    override func becomeFirstResponder() -> Bool {
        
        return true
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            songPlayer.play()
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            songPlayer.stop()
            generateAnswer()
        }
    }
    
    //Custom functions
    func generateAnswer() {
        self.labelAnswer.text = self.answersArray[Int(arc4random_uniform(self.answrsArrayLength))]
    }
    
    func prepareSongAndSession() {
        
        do {
            
            songPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "shake", ofType: "mp3")!))
            songPlayer.prepareToPlay()
            
            do {
                
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)
                
            } catch let sessionError {
                print(sessionError)
            }
            
        } catch let songPlayerError {
            print(songPlayerError)
        }
        
    }
    
}


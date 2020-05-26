//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    /*
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    */
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 420, "Hard": 720]
    var secondsPassed = 0
    var totalTime = 0
    var timer = Timer()
    var player: AVAudioPlayer!

    @IBAction func hardnessSelected(_ sender: UIButton) {
        //print(sender.currentTitle!)
        
        //progressView.progress = 1.0
        
        timer.invalidate()
        titleLabel.text = "How do you like your eggs?"

        let hardness = sender.currentTitle!
        progressView.progress = 0.0
        secondsPassed = 0
        
        /*
        if (hardness == "Soft"){
            print(softTime)
        } else if (hardness == "Medium"){
            print(mediumTime)
        } else {
            print(hardTime)
        }
        */
        //print(eggTimes[hardness]!)
        
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.update)), userInfo: nil, repeats: true)
    }
    
    @objc func update(){
        if(secondsPassed < totalTime){
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed)/Float(totalTime)
                       
            progressView.progress = percentageProgress
        } else {
            timer.invalidate()
            titleLabel.text = "Done!"
            playSound()
        }
    }
    
    func playSound(){
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        
        player.play()
    }
    
    
}

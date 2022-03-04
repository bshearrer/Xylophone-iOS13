//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
//Import for audio functionality
import AVFoundation


class ViewController: UIViewController {

    //audioPlayer allows us to play/pause our audio
    var audioPlayer = AVAudioPlayer()
    var audioSession = AVAudioSession.sharedInstance()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        try! audioSession.setCategory(AVAudioSession.Category.ambient)
        try! audioSession.setActive(true)
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        //Play button sound
        playSound(soundName: sender.currentTitle!)
        
        //reduce button opacity to 50%
        sender.alpha = 0.5

        //Code should execute after a 0.2 second delay
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(200)) {
            //button set to full opacity
            sender.alpha = 1.0
        }


    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        audioPlayer = try! AVAudioPlayer(contentsOf: url!, fileTypeHint: "wav")
        audioPlayer.play()
    }
}


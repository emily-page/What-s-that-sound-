//
//  levelThreeViewController.swift
//  What's That Sound?
//
//  Created by ios6 on 5/23/17.
//  Copyright © 2017 ios6. All rights reserved.
//

import UIKit
import AVFoundation
import CoreAudioKit

class levelThreeViewController: UIViewController
{
    @IBOutlet weak var firstOption: UIButton!
    @IBOutlet weak var secondOption: UIButton!
    @IBOutlet weak var thirdOption: UIButton!
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        firstOption.setTitle("Fart", for: .normal)
        secondOption.setTitle("Burp", for: .normal)
        thirdOption.setTitle("Puke", for: .normal)
    }
    
    @IBAction func playSound(_ sender: UIButton)
    {
        playNoise()
    }
    
    @IBAction func optionOne(_ sender: UIButton)
    {
        firstOption.setTitle("Try Again", for: .normal)
        let speech = AVSpeechSynthesizer()
        let utter = AVSpeechUtterance(string: "Try again dummy")
        speech.speak(utter)
    }
    
    @IBAction func optionTwo(_ sender: UIButton)
    {
        winAlert()
    }
    
    @IBAction func optionThree(_ sender: UIButton)
    {
        thirdOption.setTitle("Try Again", for: .normal)
        let speech = AVSpeechSynthesizer()
        let utter = AVSpeechUtterance(string: "Try again dummy")
        speech.speak(utter)
    }
    
    func playNoise()
    {
        let alertSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "burp", ofType: "mp3")!)
        audioPlayer = try! AVAudioPlayer(contentsOf: alertSound as URL, fileTypeHint: nil)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    func winAlert()
    {
        let alert = UIAlertController(title: "You won!", message: "Next Level?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "New Sound", style: .default, handler:
            { (alert) in
                //next view controller
                self.performSegue(withIdentifier: "vc4", sender: self)
        }))
        alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { (alert) in
            self.firstOption.setTitle("Fart", for: .normal)
            self.secondOption.setTitle("Burp", for: .normal)
            self.thirdOption.setTitle("Puke", for: .normal)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

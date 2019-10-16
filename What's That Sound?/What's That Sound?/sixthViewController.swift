//
//  sixthViewController.swift
//  What's That Sound?
//
//  Created by ios6 on 5/31/17.
//  Copyright © 2017 ios6. All rights reserved.
//

import UIKit
import AVFoundation
import CoreAudioKit

class sixthViewController: UIViewController
{
    @IBOutlet weak var firstOption: UIButton!
    @IBOutlet weak var secondOption: UIButton!
    @IBOutlet weak var thirdOption: UIButton!
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        firstOption.setTitle("Harry Potter", for: .normal)
        secondOption.setTitle("Pirates of the Caribbean", for: .normal)
        thirdOption.setTitle("Star Wars", for: .normal)
    }
    
    @IBAction func playSound(_ sender: UIButton)
    {
        playNoise()
    }
    
    @IBAction func optionOne(_ sender: UIButton)
    {
        firstOption.setTitle("Try Again", for: .normal)
    }
    
    @IBAction func optionTwo(_ sender: UIButton)
    {
        winAlert()
        
    }
    
    @IBAction func optionThree(_ sender: UIButton)
    {
        thirdOption.setTitle("Try Again", for: .normal)
    }
    
    func playNoise()
    {
        let alertSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "pirate", ofType: "mp3")!)
        audioPlayer = try! AVAudioPlayer(contentsOf: alertSound as URL, fileTypeHint: nil)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    func winAlert()
    {
        let alert = UIAlertController(title: "You won!", message: "Next Level?", preferredStyle: .alert)
        //        alert.addAction(UIAlertAction(title: "New Sound", style: .default, handler:
        //            { (alert) in
        //                //next view controller
        //                self.performSegue(withIdentifier: "vc5", sender: self)
        //        }))
        alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { (alert) in
            self.firstOption.setTitle("Harry Potter", for: .normal)
            self.secondOption.setTitle("Pirates of the Caribbean", for: .normal)
            self.thirdOption.setTitle("Star Wars", for: .normal)
            self.audioPlayer.stop()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

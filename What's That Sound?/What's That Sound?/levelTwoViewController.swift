//
//  levelTwoViewController.swift
//  What's That Sound?
//
//  Created by ios6 on 5/23/17.
//  Copyright © 2017 ios6. All rights reserved.
//

import UIKit
import AVFoundation
import CoreAudioKit

class levelTwoViewController: UIViewController
{
    @IBOutlet weak var firstOption: UIButton!
    @IBOutlet weak var secondOption: UIButton!
    @IBOutlet weak var thirdOption: UIButton!
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        firstOption.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "airplane"))
        firstOption.setTitle("", for: .normal)
        secondOption.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bike"))
        secondOption.setTitle("", for: .normal)
        thirdOption.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "car"))
        thirdOption.setTitle("", for: .normal)
    }
    
    @IBAction func playSound(_ sender: UIButton)
    {
        playNoise()
    }
    
    @IBAction func optionOne(_ sender: UIButton)
    {
        firstOption.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "try"))
    }
    
    @IBAction func optionTwo(_ sender: UIButton)
    {
        secondOption.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "try"))
    }
    
    @IBAction func optionThree(_ sender: UIButton)
    {
        winAlert()
    }
    
    func playNoise()
    {
        let alertSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "car", ofType: "mp3")!)
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
                 self.performSegue(withIdentifier: "vc3", sender: self)
        }))
        alert.addAction(UIAlertAction(title: "Play Again", style: .default, handler: { (alert) in
            self.firstOption.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "airplane"))
            self.firstOption.setTitle("", for: .normal)
            self.secondOption.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bike"))
            self.secondOption.setTitle("", for: .normal)
            self.thirdOption.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "car"))
            self.thirdOption.setTitle("", for: .normal)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

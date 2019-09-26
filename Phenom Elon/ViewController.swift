//
//  ViewController.swift
//  Phenom Elon
//
//  Created by Braden Hamlin on 9/26/19.
//  Copyright © 2019 Braden Hamlin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var launcher: UIImageView!
    @IBOutlet weak var launchLandButton: UIButton!
    var i = 0
    var count = 5
    var tarmacY: CGFloat = 0
    var player = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tarmacY = launcher.frame.origin.y
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func playSound(sfx: String, audioPlayer: inout AVAudioPlayer){
        if let sound = NSDataAsset(name: sfx){
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: data in \(sound)")
            }
        } else {
            print("ERROR: file \(sfx) didn't load")
        }
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        (i < count) ? (i += 1) : (i = 0)
        launcher.image = UIImage(named: "rocket\(i)")
    }
    @IBAction func launchLand(_ sender: UIButton) {
        if launcher.frame.origin.y < 0 {
            UIView.animate(withDuration: 2, animations: {self.launcher.frame.origin.y = self.tarmacY}, completion: {finished in  self.player.stop()})
            playSound(sfx: "landing", audioPlayer: &player)
            launchLandButton.setTitle("Lift Off", for: .normal)
            
        } else {
            UIView.animate(withDuration: 2, animations: {self.launcher.frame.origin.y = -self.launcher.frame.size.height}, completion: nil)
            playSound(sfx: "launch", audioPlayer: &player)
            launchLandButton.setTitle("Touch Down", for: .normal)
        }
       
    }
    
    
    
}


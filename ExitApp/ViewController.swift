//
//  ViewController.swift
//  ExitApp
//
//  Created by Scotty Shaw on 8/6/16.
//  Copyright © 2016 ___sks6___. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //        let delay = audioPlayer.duration // 7 seconds
    let delay = 3.0
    var alpha: CGFloat = 1.0
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let myButton = UIButton()
        myButton.frame.origin = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height / 2)
        myButton.bounds.size.width = 250
        myButton.bounds.size.height = 125
        myButton.setTitle("QUIT", forState: UIControlState.Normal)
        myButton.titleLabel?.font = UIFont(name: "Chalkduster", size: 50)
        myButton.titleLabel?.textAlignment = NSTextAlignment.Center
        
        myButton.setTitleColor(UIColor(red: 255, green: 0, blue: 0, alpha: 1), forState: UIControlState.Normal)
//        myButton.titleLabel?.textColor = UIColor(red: 0, green: 0, blue: 156, alpha: 1)
        
        // shadow doesn't appear
        myButton.layer.shadowColor = UIColor(red: 255, green: 180, blue: 20, alpha: 1).CGColor
//        myButton.setTitleShadowColor(UIColor(red: 180, green: 180, blue: 20, alpha: 1), forState: UIControlState.Normal)
//        myButton.titleLabel?.shadowColor = UIColor(red: 180, green: 180, blue: 20, alpha: 1)
        
        // shadow doesn't appear
        myButton.layer.shadowOffset = CGSizeMake(-10, 10)
//        myButton.titleLabel?.shadowOffset = CGSizeMake(-3, 0)
        
        myButton.layer.backgroundColor = UIColor.orangeColor().CGColor
//        myButton.backgroundColor = UIColor.greenColor()
        
        myButton.addTarget(self, action: #selector(ViewController.quitApp), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton)
        
        if let sound = self.setupAudioPlayerWithFile("Explosion", type:"m4a") {
            self.audioPlayer = sound
        }
        
        audioPlayer.volume = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupAudioPlayerWithFile(file: NSString, type: NSString) -> AVAudioPlayer?  {
        
        // 1
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        
        // 2
        var audioPlayer: AVAudioPlayer?
        
        // 3
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        }
        catch {
            print("Player not available")
        }
        
        // 4
        return audioPlayer
    }
    
    func quitApp() {
        
        // proof that app works
        audioPlayer.play()
//        print("quit")
        
        let timeInterval = 0.01
        
        NSTimer.scheduledTimerWithTimeInterval(timeInterval, target: self, selector: #selector(ViewController.fadeOut), userInfo: nil, repeats: true)
        
        NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: #selector(ViewController.selfDestruct), userInfo: nil, repeats: false)
    }
    
    func fadeOut() { // or tv turn off beeeoooooooooop
        UIView.animateWithDuration(delay, animations: {
            self.view.alpha = 0.0
        })
    }
    
    func selfDestruct() {
        // quit app using ancient C command
        exit(0)
    }
}


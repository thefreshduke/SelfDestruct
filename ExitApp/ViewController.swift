//
//  ViewController.swift
//  ExitApp
//
//  Created by Scotty Shaw on 8/6/16.
//  Copyright © 2016 ___sks6___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
        
        myButton.setTitleColor(UIColor(red: 0, green: 0, blue: 156, alpha: 1), forState: UIControlState.Normal)
//        myButton.titleLabel?.textColor = UIColor(red: 0, green: 0, blue: 156, alpha: 1)
        
        // shadow doesn't appear
        myButton.layer.shadowColor = UIColor(red: 255, green: 180, blue: 20, alpha: 1).CGColor
//        myButton.setTitleShadowColor(UIColor(red: 180, green: 180, blue: 20, alpha: 1), forState: UIControlState.Normal)
//        myButton.titleLabel?.shadowColor = UIColor(red: 180, green: 180, blue: 20, alpha: 1)
        
        // shadow doesn't appear
        myButton.layer.shadowOffset = CGSizeMake(-10, 10)
//        myButton.titleLabel?.shadowOffset = CGSizeMake(-3, 0)
        
        myButton.layer.backgroundColor = UIColor.greenColor().CGColor
//        myButton.backgroundColor = UIColor.greenColor()
        
        myButton.addTarget(self, action: #selector(ViewController.quitApp), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func quitApp() {
        
        // proof that app works
        print("quit")
        
        // quit app
        exit(0)
    }
}


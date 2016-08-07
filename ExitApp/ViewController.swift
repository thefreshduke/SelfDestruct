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
        
        let myButton = UIButton(frame: CGRect(x: self.view.bounds.width / 2, y: self.view.bounds.height / 2, width: 250, height: 125))
        myButton.setTitle("QUIT", forState: UIControlState.Normal)
        myButton.backgroundColor = UIColor.blueColor()
        myButton.addTarget(self, action: #selector(ViewController.quitApp), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(myButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func quitApp() {
        print("quit")
        exit(0)
    }
}


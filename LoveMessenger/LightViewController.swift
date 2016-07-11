//
//  LightViewController.swift
//  LoveMessenger
//
//  Created by Yusaku Eigen on 2016/07/12.
//  Copyright © 2016年 栄元優作. All rights reserved.
//

import UIKit

class LightViewController: UIViewController {
    
    @IBOutlet weak var lightLabel: UILabel!
    
    let brightness = UIScreen.mainScreen().brightness
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LightViewController.brightnessChange), name: UIScreenBrightnessDidChangeNotification, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func brightnessChange(notification: NSNotification)  {
        if notification.object != nil{
            lightLabel.text = String(notification.object!.brightness)
            if notification.object?.brightness <= 0.3 {
                performSegueWithIdentifier("LightFin", sender: nil)
            }
        }
    }
    
    
}
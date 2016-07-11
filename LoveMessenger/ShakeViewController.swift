//
//  ShakeViewController.swift
//  LoveMessenger
//
//  Created by Yusaku Eigen on 2016/07/11.
//  Copyright © 2016年 栄元優作. All rights reserved.
//

import UIKit
import CoreMotion

class ShakeViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    
    let motionManager = CMMotionManager()
    
    var x = 0
    var y = 0
    var z = 0
    
    var shakeCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        
        motionManager.accelerometerUpdateInterval = 0.2
        
        if motionManager.accelerometerAvailable == true {
            print("isAvailable")
            
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue(), withHandler: {
                (data, error) -> Void in
                self.shake(data!.acceleration)
            })
        }else{
            print("isNotAvailable")
        }
        
        
    }
    
    
    func shake(data: CMAcceleration) {
        let isShake = x != Int(data.x) || y != Int(data.y) || z != Int(data.z)
        if isShake {
            shakeCount += 1
            countLabel.text = "After \(30-shakeCount)"
            if shakeCount == 30 {
                performSegueWithIdentifier("ShakeFin", sender: nil)
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

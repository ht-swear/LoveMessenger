//
//  FInalViewController.swift
//  LoveMessenger
//
//  Created by Yusaku Eigen on 2016/07/12.
//  Copyright © 2016年 栄元優作. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var cameraImage:UIImageView!
    var id:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        messageLabel.font = UIFont.boldSystemFontOfSize(35.0)
        messageLabel.text = String(NSUserDefaults().objectForKey("Message")!)
//        imageView.transform = CGAffineTransformMakeScale(-1, 1)
        
        if id == 1{
            imageView.image = cameraImage.image
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
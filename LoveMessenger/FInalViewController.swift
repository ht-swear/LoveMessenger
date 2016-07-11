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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
        messageLabel.text = String(NSUserDefaults().objectForKey("Message")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
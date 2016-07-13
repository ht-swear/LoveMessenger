//
//  HomeViewController.swift
//  LoveMessenger
//
//  Created by Yusaku Eigen on 2016/07/07.
//  Copyright © 2016年 栄元優作. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let messageView: MessageViewController = segue.destinationViewController as! MessageViewController
        if segue.identifier == "camera"{
            messageView.id = 0
        }else if segue.identifier == "shake"{
            messageView.id = 1
        }else if segue.identifier == "call"{
            messageView.id = 2
        }
    }
   
}
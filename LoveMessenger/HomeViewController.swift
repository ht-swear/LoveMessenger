//
//  HomeViewController.swift
//  LoveMessenger
//
//  Created by Yusaku Eigen on 2016/07/07.
//  Copyright © 2016年 栄元優作. All rights reserved.
//

import UIKit
import BubbleTransition

class HomeViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    let transition = BubbleTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg")!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .Custom
        let messageView: MessageViewController = segue.destinationViewController as! MessageViewController
        if segue.identifier == "camera"{
            messageView.id = 0
        }else if segue.identifier == "shake"{
            messageView.id = 1
        }else if segue.identifier == "call"{
            messageView.id = 2
        }
    }
    
    // MARK: UIViewControllerTransitioningDelegate
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Present
        transition.startingPoint = view.center
        transition.bubbleColor = UIColor.whiteColor()
        transition.duration = 1.0
        return transition
    }
   
}
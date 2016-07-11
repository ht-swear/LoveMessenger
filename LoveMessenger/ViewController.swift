//
//  ViewController.swift
//  LoveMessenger
//
//  Created by Yusaku Eigen on 2016/07/07.
//  Copyright © 2016年 栄元優作. All rights reserved.
//

import UIKit
import BubbleTransition
import ZFRippleButton

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    @IBOutlet weak var startButton: ZFRippleButton!
    
    let transition = BubbleTransition()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController
        controller.transitioningDelegate = self
        controller.modalPresentationStyle = .Custom
    }
    
    // MARK: UIViewControllerTransitioningDelegate
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .Present
        transition.startingPoint = startButton.center
        transition.bubbleColor = UIColor(patternImage: UIImage(named: "bg")!)
        transition.duration = 1.0
        return transition
    }


}


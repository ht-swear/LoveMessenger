//
//  LightViewController.swift
//  LoveMessenger
//
//  Created by Yusaku Eigen on 2016/07/12.
//  Copyright © 2016年 栄元優作. All rights reserved.
//

import UIKit
import AudioToolbox

class CallViewController: UIViewController {
    
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    //UIDeviceクラスを呼ぶ
    let myDevice: UIDevice = UIDevice.currentDevice()
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.callButton.hidden = true
        self.imageView.hidden = true
        
        //近接センサーを有効にする
        myDevice.proximityMonitoringEnabled = true
        
        //近接センサーの通知設定
        NSNotificationCenter.defaultCenter()
            .addObserver(
                self,
                selector: "proximitySensorStateDidChange:",
                name: "UIDeviceProximityStateDidChangeNotification",
                object: nil
        )
        //近接センサーを通知する
        NSNotificationCenter.defaultCenter()
            .postNotificationName(
                "UIDeviceProximityStateDidChangeNotification",
                object: nil
        )
        
        NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: "call:", userInfo: nil, repeats: false)
    }
    
    func call(timer: NSTimer){
        self.callButton.hidden = false
        self.imageView.hidden = false
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        self.timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "vibrate:", userInfo: nil, repeats: true)
//        timer.fire()
    }
    
    func vibrate(timer: NSTimer){
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    //近接センサーの値が変更されたら呼ばれる関数
    func proximitySensorStateDidChange(notification: NSNotification){
        if myDevice.proximityState == true {
            //近接センサーのOFF
            myDevice.proximityMonitoringEnabled = false

            self.performSegueWithIdentifier("callFin", sender: nil)
        }else{
            //離れた時
        }
    }
    
    //通話ボタンが押された時実行
    @IBAction func pushCall(sender: AnyObject) {
        timer.invalidate()
        self.callButton.hidden = true
        self.imageView.hidden = true
        self.view.backgroundColor = UIColor.blackColor()
    }
    
    //ステータスバー非表示
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }}
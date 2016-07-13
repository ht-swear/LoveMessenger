//
//  CameraViewController.swift
//  LoveMessenger
//
//  Created by Yusaku Eigen on 2016/07/11.
//  Copyright © 2016年 栄元優作. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate{
    
    @IBOutlet weak var cameraImageView: UIImageView!
    
    var mySession : AVCaptureSession!
    var myDevice : AVCaptureDevice!
    var myOutput : AVCaptureVideoDataOutput!
    
    var tap : Bool! = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cameraImageView.transform = CGAffineTransformMakeScale(-1, 1)
        if initCamera() {
            mySession.startRunning()
        }
        
    }
    
    func initCamera() -> Bool {
        mySession = AVCaptureSession()
        mySession.sessionPreset = AVCaptureSessionPresetHigh
        let devices = AVCaptureDevice.devices()
        for device in devices {
            if(device.position == AVCaptureDevicePosition.Front){
                myDevice = device as! AVCaptureDevice
            }
        }
        if myDevice == nil {
            return false
        }
        let myInput = try! AVCaptureDeviceInput(device: myDevice)
        if mySession.canAddInput(myInput) {
            mySession.addInput(myInput)
        } else {
            return false
        }
        myOutput = AVCaptureVideoDataOutput()
        myOutput.videoSettings = [ kCVPixelBufferPixelFormatTypeKey: Int(kCVPixelFormatType_32BGRA) ]
        do {
            try myDevice.lockForConfiguration()
            myDevice.activeVideoMinFrameDuration = CMTimeMake(1, 15)
            myDevice.unlockForConfiguration()
        } catch {
            print("lock error")
        }
        let queue: dispatch_queue_t = dispatch_queue_create("myqueue",  nil)
        myOutput.setSampleBufferDelegate(self, queue: queue)
        myOutput.alwaysDiscardsLateVideoFrames = false
        if mySession.canAddOutput(myOutput) {
            mySession.addOutput(myOutput)
        } else {
            return false
        }
        for connection in myOutput.connections {
            if let conn = connection as? AVCaptureConnection {
                if conn.supportsVideoOrientation {
                    conn.videoOrientation = AVCaptureVideoOrientation.Portrait
                }
            }
        }
        
        return true
    }
    
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, fromConnection connection: AVCaptureConnection!){
        dispatch_sync(dispatch_get_main_queue(), {
           
            if(!self.tap){
                self.cameraImageView.image = CameraUtil.imageFromSampleBuffer(sampleBuffer)
            }
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "CameraFin"{
            let finalView:FinalViewController = segue.destinationViewController as! FinalViewController
            
            finalView.id = 1
            finalView.cameraImage = self.cameraImageView
        }
    }
    
    @IBAction func camra(sender: AnyObject) {
        if(self.tap==true){
            self.tap = false
        }else{
            self.tap = true
        }
        UIImageWriteToSavedPhotosAlbum(self.cameraImageView.image!, self, nil, nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

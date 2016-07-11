//
//  CameraViewController.swift
//  LoveMessenger
//
//  Created by Yusaku Eigen on 2016/07/11.
//  Copyright © 2016年 栄元優作. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var cameraImageView: UIImageView!
    
    @IBOutlet weak var messageText: UILabel!
    
    let userDefaults = NSUserDefaults()
    
    var flag = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        if flag == 0 {
            let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.Camera
            // カメラが利用可能かチェック
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
                // インスタンスの作成
                let cameraPicker = UIImagePickerController()
                cameraPicker.sourceType = sourceType
                cameraPicker.delegate = self
                self.presentViewController(cameraPicker, animated: true, completion: nil)
                
            }
            else{
                print("ngoi")
                
            }
            flag = 1
        }
        
    }
    
    
    //　撮影が完了時した時に呼ばれる
    func imagePickerController(imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
//        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            cameraImageView.contentMode = .ScaleAspectFit
//            cameraImageView.image = pickedImage
//            messageText.text = userDefaults.objectForKey("Message") as? String
//            
//        }
        
        //閉じる処理
        imagePicker.dismissViewControllerAnimated(true, completion: {
            self.performSegueWithIdentifier("CameraFin", sender: nil)
        })
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

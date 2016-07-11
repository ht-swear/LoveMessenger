//
//  MessageViewController.swift
//  LoveMessenger
//
//  Created by Yusaku Eigen on 2016/07/11.
//  Copyright © 2016年 栄元優作. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var messageText: UITextField!
    
    let userDefault = NSUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 仮のサイズでツールバー生成
        let kbToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 40))
        kbToolBar.barStyle = UIBarStyle.Default  // スタイルを設定
        
        kbToolBar.sizeToFit()  // 画面幅に合わせてサイズを変更
        
        // スペーサー
        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        
        // 閉じるボタン
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: #selector(MessageViewController.commitButtonTapped))
        
        kbToolBar.items = [spacer, commitButton]
        
        messageText.inputAccessoryView = kbToolBar
        
        messageText.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func commitButtonTapped (){
        userDefault.setObject(messageText.text, forKey: "Message")
        
        self.view.endEditing(true)
    }
    
    
}

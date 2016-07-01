//
//  ViewController.swift
//  VideoBackGround
//
//  Created by Homeros Bilişim on 1.07.2016.
//  Copyright © 2016 Homeros Bilişim. All rights reserved.
//

import UIKit
import TextFieldEffects

class ViewController: VideoSplashViewController {
    
    //552 × 165
    var textField :YokoTextField = YokoTextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        super.viewDidLoad()
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("maldivepoor", ofType: "mp4")!)
        self.videoFrame = view.frame
        self.fillMode = .ResizeAspectFill
        self.alwaysRepeat = true
        self.sound = false
        self.startTime = 0.8
        self.duration = 14
        //self.alpha = 0.9
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "fsc.jpg")?.drawInRect(self.view.bounds)
        let image: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.backgroundColor = UIColor(patternImage: image)
        self.contentURL = url
        
        
        
        let myimage: UIImage = UIImage(named: "hoom-small-logo")!
        let myImageView: UIImageView = UIImageView(image: myimage)
        myImageView.backgroundColor = UIColor.clearColor()
        myImageView.frame = CGRectMake((self.view.frame.size.width / 2) - 110, 150, 220.8 , 66)
        myImageView.layer.cornerRadius = 0
        myImageView.layer.masksToBounds = true
        self.view.addSubview(myImageView)
        
        let text = UILabel(frame: CGRectMake((self.view.frame.size.width / 2) - 100, 260, 200 , 60))
        text.font = UIFont(name: "Museo500-Regular", size: 21)
        text.textAlignment = NSTextAlignment.Center
        text.textColor = UIColor.whiteColor()
        text.text = "Hoş Geldiniz"
        self.view.addSubview(text)
        
        
        textField = YokoTextField(frame: CGRectMake((self.view.frame.size.width / 2) - 100, 320, 200 , 60))
        textField.placeholderColor = UIColor.whiteColor()
        textField.textAlignment = NSTextAlignment.Center
        textField.font = UIFont(name: "Museo500-Regular", size: 22)
        textField.textColor = UIColor.whiteColor()
        textField.alpha = 0.9
        textField.placeholder = "Sms ile gelen şifreyi girin."
        textField.foregroundColor = UIColor(red:0.77, green:0.25, blue:0.25, alpha:1.0)
        textField.addTarget(self, action: #selector(self.GetPwPls), forControlEvents: UIControlEvents.EditingChanged)
        self.view.addSubview(textField)
        
        
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        
    }
    
    func GetPwPls(){
      
        let textfieldcount = Int((textField.text?.characters.count)!)
        if textfieldcount == 8 {
            print(textField.text)
        }else if textfieldcount > 8{
            textField.deleteBackward()
        }
        
    }
    
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}


//
//  ViewController.swift
//  twitterSplash
//
//  Created by Rohan Lokesh Sharma on 21/10/16.
//  Copyright © 2016 rohan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,CAAnimationDelegate {
    
    
    
    var count = 0;
    
    
    @IBOutlet var mainView:UIView!
    @IBOutlet var overlay:UIView!
    var mask:CALayer!
    var animation:CABasicAnimation!
    
    override func viewDidLoad() {
        
        
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.initialize))
        self.view.addGestureRecognizer(gesture)
        
        
        
        initialize()
        
        super.viewDidLoad()
     
    }
    
    
    
    
  
    
    func initialize()
    {
        
        UIApplication.shared.isStatusBarHidden = true;
        overlay.alpha = 1.0
        mask = CALayer()
        mask.contents = UIImage(named:"tw")?.cgImage
        
        mask.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        mask.position = CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
        
        mainView.layer.mask = mask
        
        
        self.decreaseAnim()
        
        
    }
    
    func decreaseAnim()
    {
        
        
        animation = CABasicAnimation(keyPath: "bounds")
        animation.delegate = self;
        
        
        animation.duration = 0.5;
    
        animation.fromValue = NSValue(cgRect: self.mask.bounds)
        animation.toValue = NSValue(cgRect: CGRect(x: 0, y: 0, width: 80, height: 80))
        
        
        //to stop it from removing
        animation.isRemovedOnCompletion = false;
        animation.fillMode = kCAFillModeForwards
        
        mask.add(animation, forKey: "dec")

    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        
        if(anim == mask.animation(forKey: "dec"))
        {
            increaseAnim()
        }
        else{
            UIApplication.shared.isStatusBarHidden = false;
        }
        
            
        
        
    }
    
    func increaseAnim()
    {
        
        let anim = CABasicAnimation(keyPath: "bounds");
        anim.duration = 0.5;
        anim.fromValue = NSValue(cgRect: self.mask.bounds)
        anim.toValue = NSValue(cgRect: CGRect(x: 0, y: 0, width: 2500, height: 2500))
        anim.delegate = self;
        
        
        // to stop it from removing
        
        anim.isRemovedOnCompletion = false;
        anim.fillMode = kCAFillModeForwards
        
        mask.add(anim, forKey: "inc")
        
        UIView.animate(withDuration: 0.5, animations: {
            
            
            
            
            self.overlay.alpha = 0.0
            
            
            }, completion: { (my:Bool) in
        
        
               

        })
        
    }
    
    
    
   
    
    
    
    
}


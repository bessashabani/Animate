//
//  ViewController.swift
//  Animate
//
//  Created by Besjana Shabani on 01/04/16.
//  Copyright © 2016 Besjana Shabani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tap: UIButton!
    
    var imageView: UIImageView!
    
    //at first we dont have nothing animating
    var currentAnimation = 0
    
    //whenever the button is pressed.
    @IBAction func tapped(sender: UIButton) {
        
        //hide the button, until the animation is finished(it takes a second, hardly recognizable)
        tap.hidden = true
        
        
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [],            animations: { [unowned self] in
            
            
            switch self.currentAnimation {
                
            case 0:
                //scale up twice it's size
                self.imageView.transform = CGAffineTransformMakeScale(2, 2)
                
            case 1 :
                //size it back to previous size
                self.imageView.transform = CGAffineTransformIdentity
                
            case 2 :
                //move around
                self.imageView.transform = CGAffineTransformMakeTranslation(-256, -256)
                
            case 3 :
                //go back to starting point
                self.imageView.transform = CGAffineTransformIdentity
                
            case 4 :
                //rotate
                self.imageView.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
                
            case 5 :
                //flip back
                self.imageView.transform = CGAffineTransformIdentity
                
            case 6 :
                //reduce transparancy , change background color
                self.imageView.alpha = 0.1
                self.imageView.backgroundColor = UIColor.greenColor()
                
            case 7 :
                //make it visible again, remove background color
                self.imageView.alpha = 1
                self.imageView.backgroundColor = UIColor.clearColor()
                
            default:
                break
            }
            //everytime an animation is completed, the button appears again
            }) { [unowned self] (finished: Bool) in
                self.tap.hidden = false
        }
        //looping through all cases, and starting over everytime it reaches the end one
        currentAnimation += 1
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting the image of the view, with the penguin in the content folder.
        imageView = UIImageView(image: UIImage(named:"penguin"))
        
        //centering the imageview
        imageView.center = CGPoint(x: 512, y: 384)
        
        //adding the image view to the main view.
        view.addSubview(imageView)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}


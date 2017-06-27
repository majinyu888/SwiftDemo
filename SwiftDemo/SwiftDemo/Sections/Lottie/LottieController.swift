//
//  LottieController.swift
//  SwiftDemo
//
//  Created by hb on 2017/6/26.
//  Copyright © 2017年 com.bm.hb. All rights reserved.
//

/**
 https://github.com/airbnb/lottie-ios
 https://www.lottiefiles.com/
 https://github.com/bodymovin/bodymovin
 */

import UIKit
import Lottie

class LottieController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.groupTableViewBackground
        
        
        if let animationView = LOTAnimationView(name: "like") {
            animationView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            animationView.center = self.view.center
            animationView.contentMode = .scaleAspectFill
            animationView.loopAnimation = true
            view.addSubview(animationView)
            animationView.play()
        }
        
        
        //        if let animationView = LOTAnimationView(contentsOf: URL(string: "https://github.com/airbnb/lottie-ios/raw/master/Example/Assets/PinJump.json")!) {
        //            animationView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        //            animationView.center = view.center
        //            animationView.contentMode = .scaleAspectFit
        //            animationView.loopAnimation = true
        //
        //            // Applying UIView animation
        //            let minimizeTransform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        //            animationView.transform = minimizeTransform
        //            UIView.animate(withDuration: 3.0, delay: 0.0, options: [.repeat, .autoreverse], animations: {
        //                animationView.transform = CGAffineTransform.identity
        //            }, completion: nil)
        //
        //            view.addSubview(animationView)
        //            animationView.play()
        //        }
    }
    
    deinit {
        print("1")
    }
    
}

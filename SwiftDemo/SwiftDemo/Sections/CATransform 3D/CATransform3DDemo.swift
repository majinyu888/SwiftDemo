//
//  CATransform3DDemo.swift
//  SwiftDemo
//
//  Created by hb on 2017/6/22.
//  Copyright © 2017年 com.bm.hb. All rights reserved.
//


/**
 ********************** 注意 ************************
 地址:http://www.cocoachina.com/swift/20170518/19305.html
 CATransform3D 是采用三维坐标系统，
 x 轴向下为正，
 y 向右为正，
 z 轴则是垂直于屏幕向外为正。
 ********************** 注意 ************************
 */

import UIKit

class CATransform3DDemo: UIViewController {
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let subView = UIView.init(frame: self.blueView.bounds)
        subView.backgroundColor = UIColor.blue
        self.blueView.addSubview(subView)
        self.blueView.backgroundColor = UIColor.clear
        
        let handle = #selector(viewTransform(sender:))
        let pan = UIPanGestureRecognizer(target: self, action: handle)
        subView.addGestureRecognizer(pan)
    }
    
    //MARK: - IB
    
    @IBOutlet weak var blueView: UIView!
    
    //MARK: - Private Propertys
    
    var angle = CGPoint(x: 0, y: 0)
    
    //MARK: - Private Methods
    
    @objc private func viewTransform(sender: UIPanGestureRecognizer) {
        let point = sender.translation(in: blueView)
        let angleX = self.angle.x + (point.x / 30)
        let angleY = self.angle.y - (point.y / 30)
        
        var transform = CATransform3DIdentity
        /** 在真实世界中，
         当物体远离我们时，
         由于视角的关系会看起来变小，
         理论上来说，
         比较远的边会比近的边要短，
         但是实际上对系统来说他们是一样长的，
         所以我们要做一些修正。
         透过设置 CATransform3D 的 m34 为 -1.0 / d 来让影像有远近的 3D 效果，
         d 代表了想象中视角与屏幕的距离，
         这个距离只需要大概估算，
         不需要很精准的计算。
         */
        transform.m34 = -1 / 500
        transform = CATransform3DRotate(transform, angleX, 0, 1, 0)
        transform = CATransform3DRotate(transform, angleY, 1, 0, 0)
        self.blueView.layer.sublayerTransform = transform
        
        if sender.state == .ended {
            self.angle.x = angleX
            self.angle.y = angleY
        }
    }
    
}

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

class CATransform3DController: UIViewController {
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addDice()
        
        let handle = #selector(viewTransform(sender:))
        let pan = UIPanGestureRecognizer(target: self, action: handle)
        self.diceView.addGestureRecognizer(pan)
    }
    
    //MARK: - IB
    
    //MARK: - Private Propertys
    
    fileprivate var angle = CGPoint(x: 0, y: 0)
    fileprivate let diceView = UIView()
    
    //MARK: - Private Methods
    
    func addDice() {
        let viewFrame = UIScreen.main.bounds
        
        var diceTransform = CATransform3DIdentity
        
        diceView.frame = CGRect(x: 0, y: viewFrame.maxY / 2 - 50, width: viewFrame.width, height: 100)
        
        //1
        let dice1 = UIImageView.init(image: UIImage(named: "dice1"))
        dice1.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice1.layer.transform = diceTransform
        
        //6
        let dice6 = UIImageView.init(image: UIImage(named: "dice6"))
        dice6.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 0, -50)
        dice6.layer.transform = diceTransform
        
        //2
        let dice2 = UIImageView.init(image: UIImage(named: "dice2"))
        dice2.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DRotate(CATransform3DIdentity, (CGFloat.pi / 2), 0, 1, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice2.layer.transform = diceTransform
        
        //5
        let dice5 = UIImageView.init(image: UIImage(named: "dice5"))
        dice5.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DRotate(CATransform3DIdentity, (-CGFloat.pi / 2), 0, 1, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice5.layer.transform = diceTransform
        
        //3
        let dice3 = UIImageView.init(image: UIImage(named: "dice3"))
        dice3.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DRotate(CATransform3DIdentity, (-CGFloat.pi / 2), 1, 0, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice3.layer.transform = diceTransform
        
        //4
        let dice4 = UIImageView.init(image: UIImage(named: "dice4"))
        dice4.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DRotate(CATransform3DIdentity, (CGFloat.pi / 2), 1, 0, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice4.layer.transform = diceTransform
        
        diceView.addSubview(dice1)
        diceView.addSubview(dice2)
        diceView.addSubview(dice3)
        diceView.addSubview(dice4)
        diceView.addSubview(dice5)
        diceView.addSubview(dice6)
        
        view.addSubview(diceView)
        
    }
    
    @objc private func viewTransform(sender: UIPanGestureRecognizer) {
        let point = sender.translation(in: self.diceView)
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
        self.diceView.layer.sublayerTransform = transform
        
        if sender.state == .ended {
            self.angle.x = angleX
            self.angle.y = angleY
        }
    }
    
}

//
//  BezierPath.swift
//  LeftOrRight
//
//  Created by admin on 09/02/16.
//  Copyright © 2016 LoR. All rights reserved.
//

import UIKit

class BezierPath {
  
  static let LINE_WIDTH = 4.0
  
  static func addLinePercentageWithAnimattionTo(
    aView:UIView,
    duration:Float,
    startPoint:CGPoint,
    endPoint:CGPoint,
    lineColor:UIColor)
  {
    let path = UIBezierPath()
    path.moveToPoint(startPoint)
    path.addLineToPoint(endPoint)
    
    //Create a CAShape Layer
    let pathLayer = CAShapeLayer()
    pathLayer.frame = aView.bounds
    pathLayer.path = path.CGPath
    pathLayer.strokeColor = lineColor.CGColor
    pathLayer.fillColor = nil
    pathLayer.lineWidth = CGFloat(LINE_WIDTH)
    pathLayer.opacity = 0.7
    
    //Add the layer to your view's layer
    aView.layer.addSublayer(pathLayer)
    
    //This is basic animation, quite a few other methods exist to handle animation see the reference site answers
    let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
    pathAnimation.duration = Double(duration)
    pathAnimation.fromValue = NSNumber(float: 0)
    pathAnimation.toValue = NSNumber(float: 1.0)
    pathAnimation.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
    //Animation will happen right away
    pathLayer.addAnimation(pathAnimation, forKey: "strokeEnd")
  }
  
  static func addCircleWithAnimattionTo(
    aView:UIView,
    duration:Double,
    radius:Double,
    lineColor:UIColor)
  {
    let path = UIBezierPath(
      arcCenter: CGPointMake(aView.bounds.width/2, aView.bounds.height/2),
      radius: CGFloat(radius),
      startAngle: CGFloat(M_PI_2), endAngle: CGFloat(M_PI_2 + M_PI*2.0),
      clockwise: true)
    
    //Create a CAShape Layer
    let pathLayer = CAShapeLayer()
    pathLayer.frame = aView.bounds
    pathLayer.path = path.CGPath
    pathLayer.strokeColor = lineColor.CGColor
    pathLayer.fillColor = nil
    pathLayer.lineWidth = CGFloat(LINE_WIDTH)
    pathLayer.opacity = 0.8
    
    //Add the layer to your view's layer
    aView.layer.addSublayer(pathLayer)
//    
//    //This is basic animation, quite a few other methods exist to handle animation see the reference site answers
//    let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
//    pathAnimation.duration = Double(duration*2)
//    pathAnimation.fromValue = NSNumber(float: 0)
//    pathAnimation.toValue = NSNumber(float: 1.0)
//    pathAnimation.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseInEaseOut)
//    //Animation will happen right away
//    pathLayer.addAnimation(pathAnimation, forKey: "strokeEnd")
//    
    let pathAnimationOpacity = CABasicAnimation(keyPath: "opacity")
    pathAnimationOpacity.duration = Double(duration*2)
    pathAnimationOpacity.fromValue = NSNumber(float: 0.4)
    pathAnimationOpacity.toValue = NSNumber(float: 0.8)
    //Animation will happen right away
    pathLayer.addAnimation(pathAnimationOpacity, forKey: "opacity")
  }
}

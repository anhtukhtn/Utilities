//
//  LayoutConstraint.swift
//  LeftOrRight
//
//  Created by admin on 07/02/16.
//  Copyright © 2016 LoR. All rights reserved.
//

import UIKit

class LayoutConstraint {
  static func setConstraint(
    top top:Int,
    bot:Int,
    trailing:Int,
    leading:Int,
    fromView childView:UIView, toView superView:UIView) {
      
    childView.translatesAutoresizingMaskIntoConstraints = false
    
    let topConstraint = NSLayoutConstraint(
      item: childView, attribute: .Top,
      relatedBy: .Equal,
      toItem: superView, attribute: .Top,
      multiplier: 1, constant: CGFloat(top))
    superView.addConstraint(topConstraint)
    
    
    let botConstraint = NSLayoutConstraint(
      item: childView, attribute: .Bottom,
      relatedBy: .Equal,
      toItem: superView, attribute: .Bottom,
      multiplier: 1, constant: CGFloat(bot))
    superView.addConstraint(botConstraint)
    
    let leadingConstraint = NSLayoutConstraint(
      item: childView, attribute: .Leading,
      relatedBy: .Equal,
      toItem: superView, attribute: .Leading,
      multiplier: 1, constant: CGFloat(leading))
    superView.addConstraint(leadingConstraint)
    
    let trailingConstraint = NSLayoutConstraint(
      item: childView, attribute: .Trailing,
      relatedBy: .Equal,
      toItem: superView, attribute: .Trailing,
      multiplier: 1, constant: CGFloat(trailing))
    superView.addConstraint(trailingConstraint)
  }
}
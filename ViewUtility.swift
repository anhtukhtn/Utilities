//
//  ViewUtility.swift
//  LeftOrRight
//
//  Created by admin on 2/28/16.
//  Copyright © 2016 LoR. All rights reserved.
//

import UIKit


class ViewUtility {
  static func remove(aView:UIView, fadeOutDuration duration:Double) {
    UIView.animateWithDuration(duration, animations: {
        aView.alpha = 0
      },
      completion: {_ in
        aView.removeFromSuperview()
        aView.alpha = 1
    })
  }
  
  static func addFullView(view: UIView, toView superview: UIView) {
    superview.addSubview(view)
    LayoutConstraint.setConstraint(
      top: 0, bot: 0, trailing: 0, leading: 0,
      fromView: view,
      toView: superview)
  }
  
  static func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
    let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.ByWordWrapping
    label.font = font
    label.text = text
    
    label.sizeToFit()
    return label.frame.height
  }
  
  static func screenSize() -> CGSize {
    return UIScreen.mainScreen().bounds.size
  }
}
//
//  Border.swift
//  LeftOrRight
//
//  Created by admin on 3/10/16.
//  Copyright © 2016 LoR. All rights reserved.
//

import UIKit

class Border {
  
  enum Position {
    case Top
    case Bottom
    case Leading
    case Trailing
  }
  
  static func addBorderToView(
    view: UIView,
    position: Position,
    width: CGFloat,
    color: UIColor = UIColor.lightGrayColor())
  {
    let border = CALayer()
    border.backgroundColor = color.CGColor
    switch position {
    case .Top:
      border.frame = CGRect(
        x: 0.0, y: 0.0,
        width: Double(view.bounds.width), height: Double(width))
    case .Bottom:
      border.frame = CGRect(
        x: 0.0, y: Double(view.bounds.height-width),
        width: Double(view.bounds.width), height: Double(width))
    case .Leading:
      border.frame = CGRect(
        x: 0.0, y: 0.0,
        width: Double(width), height: Double(view.bounds.height))
    case .Trailing:
      border.frame = CGRect(
        x: Double(view.bounds.width-width), y: 0.0,
        width: Double(view.bounds.width), height: Double(width))
    }
    view.layer.addSublayer(border)
  }
  
}

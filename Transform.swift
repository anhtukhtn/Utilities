//
//  Transform.swift
//  LeftOrRight
//
//  Created by admin on 07/02/16.
//  Copyright © 2016 LoR. All rights reserved.
//

import UIKit

class Transform {
  static func scaleView(aView:UIView ,scaleValue scale:CGFloat) {
    aView.layer.transform = CATransform3DMakeScale(scale, scale, scale)
  }
}
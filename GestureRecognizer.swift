//
//  GestureRecognizer.swift
//  LeftOrRight
//
//  Created by admin on 08/02/16.
//  Copyright © 2016 LoR. All rights reserved.
//

import UIKit

class GestureRecognizer:NSObject, UIGestureRecognizerDelegate {
  private var _singeTapCallback:((gesture:UITapGestureRecognizer)->())?
  
  func addSingleTapGestureRecognizerToView(
    aView: UIView,
    gestureHandle callback:(gesture:UITapGestureRecognizer)->())
  {
    let singleTap = UITapGestureRecognizer(target: self, action: "handleSingleTap:")
    singleTap.delegate = self
    aView.addGestureRecognizer(singleTap)
    aView.userInteractionEnabled = true
    _singeTapCallback = callback
  }
  
  func handleSingleTap(gesture:UITapGestureRecognizer) {
    _singeTapCallback?(gesture: gesture)
  }
}

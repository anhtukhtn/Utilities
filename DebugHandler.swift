//
//  DebugHandler.swift
//  LeftOrRight
//
//  Created by admin on 06/02/16.
//  Copyright © 2016 LoR. All rights reserved.
//

import Foundation

class DebugHandler {
  static private let _enableAll = true
  
  static func log(object:AnyObject) {
    if _enableAll == true {
      print(object)
    }
  }
}

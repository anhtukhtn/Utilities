//
//  Assertion.swift
//  LeftOrRight
//
//  Created by admin on 06/02/16.
//  Copyright © 2016 LoR. All rights reserved.
//

import Foundation

class Assertion {
  static func fail(className:String, funcName:String, message:String) {
    assertionFailure(className + " " + funcName + " " + message)
  }
}
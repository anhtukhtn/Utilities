//
//  NIB.swift
//  LeftOrRight
//
//  Created by admin on 07/02/16.
//  Copyright © 2016 LoR. All rights reserved.
//

import UIKit

class NIBHandler {
  static func loadNibWithName<T:CanLoadFromNibProtocol>(viewType:T.Type) -> T? {
    let arrNib = NSBundle.mainBundle().loadNibNamed(viewType.getNibName(), owner: nil, options: nil)
    let nib = arrNib.first as? UIView ?? nil
    return nib as? T
  }
}

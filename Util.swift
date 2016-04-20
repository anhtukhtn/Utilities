//
//  Util.swift
//  BeautyVN
//
//  Created by binh.nguyen on 12/22/15.
//  Copyright © 2015 Netvis. All rights reserved.
//

import UIKit
import Foundation

class Util {
  
  static func db(text: String) {
    var tag = __FILE__ + ": " + __FUNCTION__ + ", " + __LINE__.description
    tag = ""
    print(tag + "" + text)
  }
  
  static func filePath(fileName: String) -> String {
    let folder: NSString = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
    let path = folder.stringByAppendingPathComponent(fileName)
    //        db("filePath: " + path)
    return path
  }
  
  static func fileExist(fileName: String)-> Bool {
    let fm = NSFileManager.defaultManager()
    return fm.fileExistsAtPath(filePath(fileName))
  }
  
  static func fileDelete(fileName: String)-> Bool {
    let fm = NSFileManager.defaultManager()
    do {
      try fm.removeItemAtPath(filePath(fileName))
      return true
    } catch _ {
      return false
    }
  }
  
  enum SuffixName: String { case all, png, jpg }
  static func fileList(suffix: SuffixName)-> [String] {
    var result = [String]()
    let fm = NSFileManager.defaultManager()
    let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
    let items = try! fm.contentsOfDirectoryAtPath(path)
    for item in items {
      switch suffix {
      case .all:
        result.append(item)
      default:
        if item.hasSuffix("." + suffix.rawValue) {
          result.append(item)
        }
      }
    }
    return result
  }
  
  static func mainScreen() -> CGRect {
    return UIScreen.mainScreen().bounds
  }
  
  static func getFullPath(fileName: String) -> String {
    let documentsUrl = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first
    let fileAbsoluteUrl = documentsUrl!.URLByAppendingPathComponent(fileName).absoluteURL.description
    return fileAbsoluteUrl
  }
  
  static func dict2JSONString(dict:Dictionary<String,String>) -> String {
    var jsonString = ""
    do {
      let jsonData = try NSJSONSerialization.dataWithJSONObject(dict, options: .PrettyPrinted)
      jsonString = String(data: jsonData, encoding: NSASCIIStringEncoding)!
    }
    catch {
    }
    return jsonString
  }

  static func showAlertFor(title:String, message:String) {
    let alertController = UIAlertController(
      title: title,
      message: message,
      preferredStyle: .Alert)
    let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
    alertController.addAction(defaultAction)
    let rootVC = ViewHandler.getRootViewVC()
    rootVC!.presentViewController(alertController, animated: true, completion: nil)
  }
  
  static func renderUIViewToImage(viewToBeRendered:UIView) -> UIImage
  {
    UIGraphicsBeginImageContextWithOptions(viewToBeRendered.bounds.size, viewToBeRendered.opaque, 0.0)
    viewToBeRendered.layer.renderInContext(UIGraphicsGetCurrentContext()!)
    let finalImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return finalImage
  }
  
  static func disableButtonAWhile(sender: UIButton) {
    sender.userInteractionEnabled = false
    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC)))
    dispatch_after(delayTime, dispatch_get_main_queue()) {
      sender.userInteractionEnabled = true
    }
  }
}
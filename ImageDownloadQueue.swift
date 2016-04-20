//
//  ImageDownloadQueue.swift
//  LeftOrRight
//
//  Created by mac on 4/1/16.
//  Copyright © 2016 LoR. All rights reserved.
//

import Foundation

class PendingOperations {
  lazy var downloadsInProgress = [Int:NSOperation]()
  lazy var downloadQueue:NSOperationQueue = {
    var queue = NSOperationQueue()
    queue.name = "Download queue"
    queue.maxConcurrentOperationCount = 2
    return queue
    }()
  
  func startDownloadFor(imv: ImageViewBase, index: Int, completion:()->Void) {
    if let _ = self.downloadsInProgress[index] {
      return
    }
    
    let downloader = ImageDownloader(imageRecord: imv)
    downloader.completionBlock = {
      if downloader.cancelled {
        return
      }
      dispatch_async(dispatch_get_main_queue()) {
        self.downloadsInProgress.removeValueForKey(index)
      }
    }
    downloadsInProgress[index] = downloader
    downloadQueue.addOperation(downloader)
    completion()
  }
  
  func clear() {
    downloadQueue.cancelAllOperations()
    downloadsInProgress.removeAll()
  }
}

class ImageDownloader: NSOperation {
  weak var imageRecord: ImageViewBase?
  
  init(imageRecord: ImageViewBase) {
    self.imageRecord = imageRecord
  }
  
  override func main() {
    if self.cancelled {
      return
    }
    
    if imageRecord != nil {
      let urlString = imageRecord!.getURLString()
      let imageData = NSData(contentsOfURL:self.imageRecord!.getURL())
      
      if self.cancelled {
        return
      }
      
      if imageData?.length > 0 {
        dispatch_async(dispatch_get_main_queue(), {
          let image = UIImage(data:imageData!)
          self.imageRecord!.setImageWithURL(image, urlString: urlString)
        })
      }
    }
    
    
  }
}
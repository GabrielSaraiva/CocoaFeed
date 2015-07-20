//
//  DataManager.swift
//  CocoaFeed
//
//  Created by iOS on 7/20/15.
//  Copyright (c) 2015 iOS. All rights reserved.
//

import Foundation

class DataManager {
    
    class func getTopAppsDataFromFileWithSuccess(success: ((data: NSData) -> Void)) {
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            
            let filePath = NSBundle.mainBundle().pathForResource("new-pods",ofType:"json")
            
            var readError:NSError?
            if let data = NSData(contentsOfFile:filePath!,
                options: NSDataReadingOptions.DataReadingUncached,
                error:&readError) {
                    success(data: data)
            }
        })
    }
    
}

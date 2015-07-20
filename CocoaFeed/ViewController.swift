//
//  ViewController.swift
//  CocoaFeed
//
//  Created by iOS on 7/20/15.
//  Copyright (c) 2015 iOS. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    struct Entry {
        let content: NSString
        let contentSnippet: NSString
        let link: NSURL
        let publishedDate: NSDate
        let title: NSString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DataManager.getTopAppsDataFromFileWithSuccess { (data) -> Void in
        
            var parseError: NSError?
            let parsedObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(data,
                options: NSJSONReadingOptions.AllowFragments, error:&parseError)

            if let feeds = parsedObject as? NSDictionary {
                if let responseData = feeds["responseData"] as? NSDictionary {
                    if let entries = responseData["feed"] as? NSArray {
                        if let firstFeed = entries[0] as? NSDictionary {
                            if let title = firstFeed["title"] as? NSString {
                                    println("Teste: \(title)")
                            }
                        }
                    }
                }
            }

            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = "\(indexPath.section) - \(indexPath.row)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    

}


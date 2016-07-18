//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Edgar on 7/17/16.
//  Copyright © 2016 Edgar. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var history: [History]!

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HistoryCellReuse")!
        let hist = self.history[indexPath.row]
        cell.textLabel?.text = hist.result
        cell.detailTextLabel?.text = hist.plays
        cell.imageView?.image = UIImage(named: hist.image)
        
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "backToGame"){
            let controller = segue.destinationViewController as! ViewController
            controller.history = self.history
        }
    }
}

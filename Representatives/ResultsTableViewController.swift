//
//  ResultsTableViewController.swift
//  Representatives
//
//  Created by Michael Mecham on 2/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

// toResultsSegue

import UIKit

class ResultsTableViewController: UITableViewController {
    
    var representative: [Representative] = []
    var state: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return representative.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("resultsCell", forIndexPath: indexPath)
        
        let rep = self.representative[indexPath.row]
        
        if let name = rep.name, party = rep.party {
            cell.textLabel?.text = name
            cell.detailTextLabel?.text = party
            if party == "I" {
                cell.detailTextLabel?.textColor = UIColor.yellowColor()
            } else if party == "D" {
                cell.detailTextLabel?.textColor = UIColor.blueColor()
            } else if party == "R" {
                cell.detailTextLabel?.textColor = UIColor.redColor()
            }
        }
        
        
        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetailSegue" {
            guard let cell = sender as? UITableViewCell else { return }
            
            let indexPath = self.tableView.indexPathForCell(cell)!
            let rep = self.representative[indexPath.row]
            
            let repDetailTableviewController = segue.destinationViewController as! RepresentativeDetailTableViewController
            repDetailTableviewController.representative = rep
            
        }
    }
    
    
}

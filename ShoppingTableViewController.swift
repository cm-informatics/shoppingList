//
//  ShoppingTableViewController.swift
//  ShoppingList
//
//  Created by Christian Mansch on 11.05.16.
//  Copyright © 2016 Christian Mansch. All rights reserved.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    var shoppingArray: NSMutableArray = ["Butter", "Mehl", "Wasser", "Käse"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return shoppingArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = "\(shoppingArray.objectAtIndex(indexPath.row))"

        return cell
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            shoppingArray.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    @IBAction func updateList(sender: AnyObject)
    {
        let alertView = UIAlertController(title: "Eingabe", message: "Bitte einen Text eingeben", preferredStyle: .Alert)
        alertView.addTextFieldWithConfigurationHandler(nil)
        
        if sender.isKindOfClass(UITableViewCell)
        {
            alertView.textFields?.first?.text = sender.textLabel!!.text
        }
        
        
        alertView.addAction(UIAlertAction(title: "OK", style: .Default, handler:
        {
            (action: UIAlertAction) in
            if let text = alertView.textFields?.first?.text
            {
                if (sender.isKindOfClass(UIBarButtonItem))
                {
                    self.shoppingArray.addObject(text)
                    self.tableView.reloadData()
                }
                else
                {
                    let index = self.shoppingArray.indexOfObject(sender.textLabel!!.text!)
                    self.shoppingArray.replaceObjectAtIndex(index, withObject: text)
                    self.tableView.reloadData()
                }

            }
        }))
        
        alertView.addAction(UIAlertAction(title: "Abbrechen", style: .Cancel, handler: nil))
        
        self.presentViewController(alertView, animated: true, completion: nil)
    }
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath)
    {
        let itemToMove = shoppingArray[fromIndexPath.row]
        shoppingArray.removeObjectAtIndex(fromIndexPath.row)
        shoppingArray.insertObject(itemToMove, atIndex: toIndexPath.row)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        updateList(cell!)
    }
    
    override func tableView(tableView: UITableView, shouldShowMenuForRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    override func tableView(tableView: UITableView, canPerformAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        if ( action == #selector(NSObject.copy(_:)))
        {
            return true
        }
        return false
    }
    
    override func tableView(tableView: UITableView, performAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        let pasteBoard = UIPasteboard.generalPasteboard()
        pasteBoard.string = cell?.textLabel?.text
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

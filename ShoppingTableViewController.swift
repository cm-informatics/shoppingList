//
//  ShoppingTableViewController.swift
//  ShoppingList
//
//  Created by Christian Mansch on 11.05.16.
//  Copyright © 2016 Christian Mansch. All rights reserved.
//

import UIKit

class ShoppingTableViewController: UITableViewController {

    //var shoppingArray: NSMutableArray = ["Butter", "Mehl", "Wasser", "Käse"]
    var shoppingArray: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return shoppingArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = "\(shoppingArray.object(at: indexPath.row))"
        return cell
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            shoppingArray.removeObject(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        else if editingStyle == .insert
        {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    @IBAction func updateList(_ sender: AnyObject)
    {
        let alertView = UIAlertController(title: "Eingabe", message: "Bitte einen Text eingeben", preferredStyle: .alert)
        alertView.addTextField { (textField: UITextField) in
            textField.autocapitalizationType = .words
        }
    
        if sender.isKind(of: UITableViewCell.self)
        {
            alertView.textFields?.first?.text = sender.textLabel!!.text
        }
        
        alertView.addAction(UIAlertAction(title: "OK", style: .default, handler:
        {
            (action: UIAlertAction) in
            if let text = alertView.textFields?.first?.text
            {
                if sender.isKind(of: UIBarButtonItem.self)
                {
                    self.shoppingArray.add(text)
                    self.tableView.reloadData()
                }
                else
                {
                    let index = self.shoppingArray.index(of: sender.textLabel!!.text!)
                    self.shoppingArray.replaceObject(at: index, with: text)
                    self.tableView.reloadData()
                }

            }
        }))
        
        alertView.addAction(UIAlertAction(title: "Abbrechen", style: .cancel, handler: nil))
        
        self.present(alertView, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath)
    {
        let itemToMove = shoppingArray[fromIndexPath.row]
        shoppingArray.removeObject(at: fromIndexPath.row)
        shoppingArray.insert(itemToMove, at: toIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = tableView.cellForRow(at: indexPath)
        updateList(cell!)
    }
    
    override func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    override func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        if ( action == #selector(copy(_:)))
        {
            return true
        }
        return false
    }
    
    override func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        let cell = tableView.cellForRow(at: indexPath)
        let pasteBoard = UIPasteboard.general
        pasteBoard.string = cell?.textLabel?.text
    }
    
    // MARK: - Unwind Segues
    
    @IBAction func backNavigation(_ sender: UIStoryboardSegue)
    {
        if let identifier = sender.identifier
        {
            if identifier == "saveItemsUnwind"
            {
                let sourceViewController = sender.source as! SupportListTableViewController
                print("Die gewählten Items sind: \(sourceViewController.selectedItems)")
                shoppingArray.removeAllObjects()
                shoppingArray.addObjects(from: sourceViewController.selectedItems)
                tableView.reloadData()
            }
            
        }
        else{
            print("is nil")
        }
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

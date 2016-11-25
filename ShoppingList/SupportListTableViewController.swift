//
//  SupportListTableViewController.swift
//  ShoppingList
//
//  Created by Christian Mansch on 24.11.16.
//  Copyright © 2016 Christian Mansch. All rights reserved.
//

import UIKit

class SupportListTableViewController: UITableViewController {

    var items = [String]()
    var selectedItems = [String]()
    
    var boolArray = [Bool]()  // Needed to keep track of the selected cells with checkmarks
    
    override func viewDidLoad() {
        super.viewDidLoad()

        items = self.loadItems()
    }

   func loadItems() -> Array<String> {
    
        let path = Bundle.main.path(forResource: "ListItems", ofType: "txt")
        var text = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        text = text.trimmingCharacters(in: .whitespacesAndNewlines)
        let items = text.components(separatedBy: ",")
    
        //print(items)
    
        return items
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        boolArray.append(false) // Default initialization for every item is false
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.accessoryType = boolArray[indexPath.row] ? .checkmark : .none  // Is always false (here .none) until didSelectRowAtIndexPath() is called

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath)
        {
            
            if cell.accessoryType == UITableViewCellAccessoryType.none
            {
                cell.accessoryType = .checkmark
                selectedItems.append(cell.textLabel!.text!)
                boolArray[indexPath.row] = true
            }
            else
            {
                cell.accessoryType = .none
                let index = selectedItems.index(of: cell.textLabel!.text!)
                selectedItems.remove(at: index!)
                boolArray[indexPath.row] = false
            }
        }
        
        print(selectedItems)
    }
  
    /*deinit {
        print("Killed")
    }
     */
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

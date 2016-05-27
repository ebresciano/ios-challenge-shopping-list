//
//  ShoppingListTableViewController.swift
//  ShoppingList
//
//  Created by Eva Marie Bresciano on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit
import CoreData

class ShoppingListTableViewController: UITableViewController, ShoppingTableViewCellDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
      ShoppingController.sharedController.fetchedResultsController.delegate = self
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonCellButtonTapped(cell: ButtonTableViewCell) {
        <#code#>
    }
    
    // MARK: - Action button

    @IBAction func addButtonTapped(sender: AnyObject) {
        presentAlertController()
    }
    
    // MARK: Alert Controller
    
    func presentAlertController() {
        
        var nameTextField: UITextField?
        
         let alertController = UIAlertController(title: "Add item", message: "What do you need to buy?", preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler {(textField) in
            textField.placeholder = "Item name..."
            nameTextField = textField }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let makeAction = UIAlertAction(title: "Add", style: .Default) {(_) in
            guard let name = nameTextField?.text where name.characters.count > 0 else { return }
            ShoppingController.sharedController.addShopping(name: String)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(makeAction)
        
        presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        guard let sections = ShoppingController.sharedController.fetchedResultsController.sections else { return 0}
        return sections.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let sections = ShoppingController.sharedController.fetchedResultsController.sections else {
            return 0 }
        return sections[section].numberOfObjects
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("shoppingCell", forIndexPath: indexPath) as? ButtonTableViewCell,
            shopping = ShoppingController.sharedController.fetchedResultsController.objectAtIndexPath(indexPath) as? Shopping else {
                return UITableViewCell()
        }
        cell.updateWithShopping(shopping)
        return cell
    }
   

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            guard let shopping = ShoppingController.sharedController.fetchedResultsController.objectAtIndexPath(indexPath) as? Shopping else {return}
            ShoppingController.sharedController.removeShopping(shopping)
        }
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sections = ShoppingController.sharedController.fetchedResultsController.sections else {
            return nil }
        let value = Int(sections[section].name)
        if value == 0 { return "Need to get this!"
        } else { return "Obtained"
    }
    
}
   

}

extension ShoppingListTableViewController: NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
}

}



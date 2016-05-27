//
//  ShoppingController.swift
//  ShoppingList
//
//  Created by Eva Marie Bresciano on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class ShoppingController {
    
    static let sharedController = ShoppingController()
    
    var fetchedResultsController = NSFetchedResultsController()
    
    let moc = Stack.sharedStack.managedObjectContext
    
    init() {
        let request = NSFetchRequest(entityName: "Shopping")
        let sortDescriptor = NSSortDescriptor(key: "didBuy", ascending: false)
        request.sortDescriptors = [sortDescriptor]
        fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: Stack.sharedStack.managedObjectContext, sectionNameKeyPath: "didBuy", cacheName: nil)
        _ = try? fetchedResultsController.performFetch()
        
    }
    
    func addShopping(name: String) {
        let shopping = Shopping(name: String)
        saveToPersistentStorage()
        
    }
    
    func removeShopping(shopping: Shopping) {
     let moc = Stack.sharedStack.managedObjectContext
        moc.deleteObject(shopping)
        
        
    }
    
    func saveToPersistentStorage(){
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Could not save")
        }
        
    }
    
    
}
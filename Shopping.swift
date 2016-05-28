//
//  Shopping.swift
//  ShoppingList
//
//  Created by Eva Marie Bresciano on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData


class Shopping: NSManagedObject {

    convenience init?(name: String, didBuy: Bool = false, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        guard let entity = NSEntityDescription.entityForName("Shopping", inManagedObjectContext: context) else {return nil}
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        self.name = name
        self.didBuy = didBuy
        
    }

}

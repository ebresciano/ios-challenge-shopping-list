//
//  Shopping+CoreDataProperties.swift
//  ShoppingList
//
//  Created by Eva Marie Bresciano on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Shopping {

    @NSManaged var name: String
    @NSManaged var didBuy: NSNumber

}

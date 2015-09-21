//
//  Product+CoreDataProperties.swift
//  ShoppingCart
//
//  Created by John Alexandert Torres on 9/20/15.
//  Copyright © 2015 test. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Product {

    @NSManaged var id: String?
    @NSManaged var name: String?
    @NSManaged var price: Float
    @NSManaged var stock: Int16
    @NSManaged var maxstock: Int16

}

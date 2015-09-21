//
//  ProductsManager+NSFechedResultsViewController.swift
//  ShoppingCart
//
//  Created by John Alexandert Torres on 9/20/15.
//  Copyright © 2015 test. All rights reserved.
//

import CoreData


extension ProductsManager {

    var fetchedResultsController: NSFetchedResultsController {
        let predicate = NSPredicate(format: "stock > 0")
        
        return generatefetchResultsControllerWithPredicate(predicate)
    }
    var fetchedResultsControllerBoughtItems: NSFetchedResultsController {
        let predicate = NSPredicate(format: "maxstock - stock > 0")

        return generatefetchResultsControllerWithPredicate(predicate)
    }
    private func generatefetchResultsControllerWithPredicate(predicate:NSPredicate) -> NSFetchedResultsController {
        let managedObjectContext = NSManagedObjectContext.MR_defaultContext()
        let request = Product.MR_requestAllWithPredicate(predicate)
        let sort = NSSortDescriptor(key: "name", ascending: true)
        request.sortDescriptors = [sort]
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        do {
            try aFetchedResultsController.performFetch()
        } catch let error as NSError {
            print("Error: \(error.localizedDescription)")
            abort()
        }
        
        return aFetchedResultsController
    }
}



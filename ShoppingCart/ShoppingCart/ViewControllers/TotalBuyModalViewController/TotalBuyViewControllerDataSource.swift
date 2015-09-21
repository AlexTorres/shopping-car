//
//  TotalViewController.swift
//  ShoppingCart
//
//  Created by John Alexandert Torres on 9/20/15.
//  Copyright © 2015 test. All rights reserved.
//

import UIKit
import CoreData

extension TotalBuyModalViewController:UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let sections = ProductsManager.sharedInstance.fetchedResultsControllerBoughtItems.sections {
            return sections.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            if let sections = ProductsManager.sharedInstance.fetchedResultsControllerBoughtItems.sections {
                let currentSection = sections[section] as NSFetchedResultsSectionInfo
                return currentSection.numberOfObjects
            }
            return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell :TotalBuyViewCell = productBuyTableViewController.dequeueReusableCellWithIdentifier("TotalBuyViewCell", forIndexPath: indexPath) as! TotalBuyViewCell
        let product = ProductsManager.sharedInstance.fetchedResultsControllerBoughtItems.objectAtIndexPath(indexPath) as! Product
        cell.productNameLabel.text = product.name
        cell.currentProducts.text = String(product.currentItems)
        cell.delegate = self
        cell.productId = product.id
        return cell
    }

}

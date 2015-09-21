//
//  ViewControllerUITableViewDataSource.swift
//  ShoppingCart
//
//  Created by John Alexandert Torres on 9/18/15.
//  Copyright © 2015 test. All rights reserved.
//

import UIKit
import CoreData

//MARK: - TableView Data Source Delegate

extension ViewController:UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let sections = ProductsManager.sharedInstance.fetchedResultsController.sections {
            return sections.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            if let sections = ProductsManager.sharedInstance.fetchedResultsController.sections {
                let currentSection = sections[section] as NSFetchedResultsSectionInfo
                return currentSection.numberOfObjects
            }
            return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell :ProductTableViewCell = productsTableView.dequeueReusableCellWithIdentifier(Constants.Product.cellNibName, forIndexPath: indexPath) as! ProductTableViewCell
        let product = ProductsManager.sharedInstance.fetchedResultsController.objectAtIndexPath(indexPath) as! Product
        cell.productNameLabel.text = product.name
        cell.priceLabel.text = String(product.price)
        cell.stockLabel.text = String(product.stock)
        cell.productid = product.id

        cell.itemsBought.text = "cart\(product.currentItems),price\(product.currentPrice)"
        cell.delegate = self
        return cell
    }

}

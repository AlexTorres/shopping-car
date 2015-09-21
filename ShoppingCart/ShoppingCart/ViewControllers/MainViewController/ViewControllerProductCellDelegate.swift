//
//  ViewControllerProductCellDelegate.swift
//  ShoppingCart
//
//  Created by John Alexandert Torres on 9/18/15.
//  Copyright © 2015 test. All rights reserved.
//



extension ViewController:ProductTableViewCellProtocol {

    func buyProduct(prodcutCell: ProductTableViewCell) {
        ProductsManager.sharedInstance.addProductToCardByID(prodcutCell.productid!)
        productsTableView.reloadData()
    }
   
}

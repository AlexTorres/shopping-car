//
//  PoductTableViewCell.swift
//  ShoppingCart
//
//  Created by John Alexandert Torres on 9/18/15.
//  Copyright © 2015 test. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var stockLabel: UILabel!
    @IBOutlet weak var buyProductButton: UIButton!
    @IBOutlet weak var itemsBought: UILabel!
    
    var productid:String?
    var delegate:ProductTableViewCellProtocol?
    
    let tapRec = UITapGestureRecognizer()
    
    @IBAction func buyProdcut(sender: AnyObject) {
        delegate?.buyProduct(self)
    }

}

protocol ProductTableViewCellProtocol {
    // protocol definition goes here
    func buyProduct(prodcutCell: ProductTableViewCell)
   
}

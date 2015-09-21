//
//  TotalBuyViewCell.swift
//  ShoppingCart
//
//  Created by John Alexandert Torres on 9/20/15.
//  Copyright © 2015 test. All rights reserved.
//

import UIKit

class TotalBuyViewCell: UITableViewCell {
var delegate:BuyTableViewCellProtocol?
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var currentProducts: UILabel!
        @IBOutlet weak var delete: UIButton!
    
    var productId:String?
    
    @IBAction func deleteActtion(sender: AnyObject) {
        self.delegate?.deleteProduct(self)
    }
}

protocol BuyTableViewCellProtocol {
    func deleteProduct(prodcutCell: TotalBuyViewCell)
}

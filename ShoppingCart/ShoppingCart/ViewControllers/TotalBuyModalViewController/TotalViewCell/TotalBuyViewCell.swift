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
    
    var productId:String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


    
    @IBAction func deleteActtion(sender: AnyObject) {
        self.delegate?.deleteProduct(self)
        
    }
    @IBOutlet weak var delete: UIButton!
    
}

protocol BuyTableViewCellProtocol {
    // protocol definition goes here
    func deleteProduct(prodcutCell: TotalBuyViewCell)
 
}

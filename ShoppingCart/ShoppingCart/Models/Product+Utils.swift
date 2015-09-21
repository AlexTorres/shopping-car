//
//  Product+Utils.swift
//  ShoppingCart
//
//  Created by John Alexandert Torres on 9/20/15.
//  Copyright © 2015 test. All rights reserved.
//

import Foundation

extension Product {
    
    func subtractToStock() ->Bool {
        if(self.stock <= 0){
            return false
        } else {
            stock -= 1
            
            return true
        }
    }
    func addToStock() ->Bool {
        if(self.stock >= self.maxstock){
            return false
        } else {
            stock += 1
            
            return true
        }
    }
    
    func deleteItem() {
        MR_deleteEntity()
    }
    
    func reloadStock() {
        stock = maxstock
    }
    
    var currentItems:Int {
        get {
            
            return maxstock - stock
        }
    }
    
    var currentPrice:Float {
        get {
            
            return Float(currentItems) * price
        }
    }
}
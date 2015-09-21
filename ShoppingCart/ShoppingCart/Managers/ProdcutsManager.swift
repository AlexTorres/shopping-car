//
//  ProdcutsManager.swift
//  ShoppingCart
//
//  Created by John Alexandert Torres on 9/19/15.
//  Copyright © 2015 test. All rights reserved.
//

import Foundation
import SwiftyJSON
import MagicalRecord
import CoreData

class ProductsManager: Manager {
    
    var gameScore: Int = 0
    var dummyJsonWasLoaded = false;
    var productsArray:Array<JSON> = []
    var productsCoreDataArray :Array <Product> = []
    var managedObjectContext: NSManagedObjectContext?
    
    class var sharedInstance: ProductsManager {
        struct Static {
            static let instance: ProductsManager = ProductsManager()
        }
        return Static.instance
    }
    func loadDummyJSON(completion:CompletionBooleanBlock) {
        productsCoreDataArray = Product.MR_findAll() as! [Product]
        if (productsCoreDataArray.isEmpty) {
            let path = NSBundle.mainBundle().pathForResource("dummy", ofType: "json")
            let jsonData = try? NSData(contentsOfFile: path!, options: NSDataReadingOptions.DataReadingMappedIfSafe)
            let json = JSON(data: jsonData!)
            if let products = json[Constants.Product.productsKey].array {
                productsArray = products as Array
                for element in productsArray {
                    saveProductWIthJSON(element)
                }
                NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait();
               
            }
        }
        completion(true);
    }
    private func saveProductWIthJSON(JSONObject:JSON) {
        let productEntity = Product.MR_createEntity() as Product
        productEntity.id = JSONObject[Constants.Product.idKey].stringValue
        productEntity.name = JSONObject[Constants.Product.nameKey].stringValue
        productEntity.price = JSONObject[Constants.Product.priceKey].floatValue
        productEntity.stock = JSONObject[Constants.Product.stockKey].int16Value
        productEntity.maxstock = productEntity.stock
    }
    func addProductToCardByID(productID:String) {
        let productFilter = NSPredicate(format:"id=%@",productID);
        let results = Product.MR_findAllWithPredicate(productFilter)
        if (!results.isEmpty) {
            let productEntity = results[0] as! Product
            productEntity.subtractToStock()
            print(productEntity.description)
        }
    }

    func deleteProductFromCatr(productID:String) {
        let productFilter = NSPredicate(format:"id=%@",productID);
        let results = Product.MR_findAllWithPredicate(productFilter)
        if (!results.isEmpty) {
            let productEntity = results[0] as! Product
            productEntity.reloadStock()
            print(productEntity.description)
        }
    }
}

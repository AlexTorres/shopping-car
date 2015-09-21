//
//  ViewController.swift
//  ShoppingCart
//
//  Created by John Alexandert Torres on 9/18/15.
//  Copyright © 2015 test. All rights reserved.
//

import UIKit


class ViewController: UIViewController,BuyModalProtocol {

    @IBOutlet weak var productsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        ProductsManager.sharedInstance.loadDummyJSON { (complete:Bool?) -> Void in
            if((complete) != nil) {
                self.productsTableView.reloadData();
            }
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showCart(sender: AnyObject) {
        self.performSegueWithIdentifier("BuyModalView", sender: self)
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cartModalView  = segue.destinationViewController as! TotalBuyModalViewController
        cartModalView.delegate = self
    }
    func done() {
        productsTableView.reloadData();
    }

}


//
//  TotalBuyModalViewController.swift
//  ShoppingCart
//
//  Created by John Alexandert Torres on 9/20/15.
//  Copyright © 2015 test. All rights reserved.
//

import UIKit

class TotalBuyModalViewController: UIViewController,BuyTableViewCellProtocol {

    @IBOutlet weak var productBuyTableViewController: UITableView!
    var delegate:BuyModalProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true) { () -> Void in
            delegate?.done()
        }
    }
    
    func deleteProduct(prodcutCell: TotalBuyViewCell) {
        ProductsManager.sharedInstance.deleteProductFromCatr(prodcutCell.productId!)
        productBuyTableViewController.reloadData()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

protocol BuyModalProtocol {
    // protocol definition goes here
    func done()
    
}

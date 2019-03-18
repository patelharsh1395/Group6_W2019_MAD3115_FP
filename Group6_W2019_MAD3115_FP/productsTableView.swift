//
//  productsPage.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-14.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class productsTableView: UIViewController , UITableViewDataSource , UITableViewDelegate{
    
    

    @IBOutlet weak var tableView: UITableView!
    var custSession : String? = UserDefaults.standard.string(forKey: "customer")!
    var cust : Customer!
    {
        get
        {
            return Customer.usersDictionary[custSession!]?.1
            
        }
    }
    var shoppingCart : ShoppingCart!
    {
        get
        {
           return self.cust.shopping_cart
            //Customer.usersDictionary[custSession!]?.1.shopping_cart
        }
    }
    var items = Items.read_items_arr
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView.tag == 0)
        {
            return self.items.count
        }
        else
        {
            return self.shoppingCart.readItemFromCart.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView.tag == 0)
        {
            var cell : CustomCell  = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! CustomCell
            
            cell.itemNAME.text  = self.items[indexPath.row].0
            cell.itemMFG.text = ""
            cell.itemPrice.text = "\(self.items[indexPath.row].1)"
            cell.itemIMG.image = UIImage(named: "\(self.items[indexPath.row].0)")
            
            return cell
        }
        else
        {
            var cell2 : CellsForShoppingCart = self.tableView.dequeueReusableCell(withIdentifier: "cellForCart", for: indexPath) as! CellsForShoppingCart
            cell2.itemIMG.image = UIImage(named: "\(self.shoppingCart.readItemsFromCartArr[indexPath.row].0)")
            cell2.itemName.text = self.shoppingCart.readItemsFromCartArr[indexPath.row].0
            cell2.itemPrice.text = "\(String(describing: Items.read_items[cell2.itemName.text!]))"
            return cell2
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableView.tag == 0)
        {
            self.performSegue(withIdentifier: "toRandom", sender: indexPath)
        }
        
        
    }

}

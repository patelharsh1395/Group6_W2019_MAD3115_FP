//
//  ShoppingCartPage.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-17.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class ShoppingCartPage: UIViewController , UITableViewDelegate , UITableViewDataSource  {
     var custSession : String? = UserDefaults.standard.string(forKey: "customer")!
    @IBOutlet weak var tableView: UITableView!
    
    
     var items = Items.read_items_arr
    
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
         self.tableView.reloadData()
            if let item = self.tabBarController?.tabBar.items
            {
                    let temp = item[2]
                    if( self.shoppingCart.readItemFromCart.count != 0 )
                    {
                            temp.badgeValue = "\(self.shoppingCart.readItemFromCart.count)"
                    }
                    else
                    {
                            temp.badgeValue = nil
                    }
            }
        
        
    }
    
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        if(section == 0)
        {
            return self.shoppingCart.readItemFromCart.count
        
        }
        else
        {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(indexPath.section == 0)
        {
        
            var cell2 : CellsForShoppingCart = self.tableView.dequeueReusableCell(withIdentifier: "cellForCart", for: indexPath) as! CellsForShoppingCart
            cell2.itemIMG.image = UIImage(named: "\(self.shoppingCart.readItemsFromCartArr[indexPath.row].0)")
            cell2.itemName.text = self.shoppingCart.readItemsFromCartArr[indexPath.row].0
            cell2.itemPrice.text = "\(Items.read_items[cell2.itemName.text!]!.dollar()))"
            cell2.Qty.text = "QTY : \(self.shoppingCart.readItemsFromCartArr[indexPath.row].1)"
            cell2.itemIMG.image = UIImage(named: "\(self.shoppingCart.readItemsFromCartArr[indexPath.row].0)")
            cell2.total.text = "TOTAL : \((self.shoppingCart.readItemsFromCartArr[indexPath.row].1) * Items.read_items[self.shoppingCart.readItemsFromCartArr[indexPath.row].0]! )"
         print("Hello :",indexPath.row)
        
        return cell2
        }
        else
        {
            var cell2 : CellForTotal  = self.tableView.dequeueReusableCell(withIdentifier: "cellForTotalAMT", for: indexPath) as! CellForTotal
            var tempGrandTotal : Float = 0
            for price in Items.read_items_arr
            {
                for qty in self.shoppingCart.readItemsFromCartArr
                {
                    if(price.0 == qty.0)
                    {
                        tempGrandTotal += price.1 * qty.1
                    }
                }
            }
            cell2.total.text = "Total price : \(tempGrandTotal.dollar())"
            
            return cell2
        }
       
        
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
       
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 160
    }
    
   
   
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if(indexPath.section == 0)
        {
        return true
        }
        return false
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)  {
        do
        {
        
        if(editingStyle == UITableViewCell.EditingStyle.delete)
                {
                    
                 try self.shoppingCart.removeItem(item: self.shoppingCart.readItemsFromCartArr[indexPath.row].0)
                  
                    if let items = self.tabBarController?.tabBar.items
                    {
                        var temp = items[2]
                        if(self.shoppingCart.readItemFromCart.count != 0)
                        {
                            temp.badgeValue = "\(self.shoppingCart.readItemFromCart.count)"
                        }
                        else
                        {
                            temp.badgeValue = nil
                        }
                    }
                     tableView.reloadData()
                }
        }
        catch
        {
            print("\(error)")
        }
    }
   
    


}

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
    
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        
            return self.shoppingCart.readItemFromCart.count
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
   
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
//     private func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)  throws {
//        if(editingStyle == UITableViewCell.EditingStyle.delete)
//        {
//            tableView.beginUpdates()
//            try self.shoppingCart.removeItem(item: self.shoppingCart.readItemsFromCartArr[indexPath.row].0 )
//            tableView.endUpdates()
//            tableView.reloadData()
//        }
//    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)  {
        do
        {
        
        if(editingStyle == UITableViewCell.EditingStyle.delete)
                {
                    
                 try self.shoppingCart.removeItem(item: self.shoppingCart.readItemsFromCartArr[indexPath.row].0)
                   tableView.reloadData()
                    
                }
        }
        catch
        {
            print("\(error)")
        }
    }
   
    


}

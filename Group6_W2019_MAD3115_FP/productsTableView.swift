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
        //self.logout()
       // self.hideBack()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            return self.items.count
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
            var cell : ProductCell  = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! ProductCell
            
            cell.itemNAME.text  = self.items[indexPath.row].0
            cell.itemMFG.text = ""
            cell.itemPrice.text = self.items[indexPath.row].1.dollar()
            cell.itemIMG.image = UIImage(named: "\(self.items[indexPath.row].0)")
        if(self.shoppingCart.readItemFromCart.contains(where: { (key, value) -> Bool in
            return key == cell.itemNAME.text
        }))
        {
            cell.includedIMG.isHidden = false
        }
        else
        {
            cell.includedIMG.isHidden = true
        }
            return cell
        
       
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
        if let items = self.tabBarController?.tabBar.items
        {
            var temp = items[1]
            if(self.shoppingCart.readItemFromCart.count != 0)
            {
                temp.badgeValue = "\(self.shoppingCart.readItemFromCart.count)"
            }
            else
            {
                 temp.badgeValue = nil
            }
        }
        
        
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            ProductDetails.itemdesc = "......"
            ProductDetails.itemname = Items.read_items_arr[indexPath.row].0
            ProductDetails.itemprice = Items.read_items[ProductDetails.itemname]
            ProductDetails.itemimg = ProductDetails.itemname
             self.performSegue(withIdentifier: "toProductDetails", sender: indexPath)
        
        
        
    }
   
    func hideBack()
    {
        self.navigationItem.hidesBackButton = true
        let buttonLogout = UIBarButtonItem(title:"Logout", style: UIBarButtonItem.Style.plain, target: self, action: #selector(productsTableView.logout))
       
        self.navigationItem.rightBarButtonItem = buttonLogout
    }

    @objc func logout()
    {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}



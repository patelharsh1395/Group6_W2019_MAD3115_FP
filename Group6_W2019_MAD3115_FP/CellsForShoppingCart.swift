//
//  CellsForShoppingCart.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-17.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class CellsForShoppingCart: UITableViewCell {

  
  
    
   
    @IBOutlet weak var itemIMG: UIImageView!
    
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var Qty: UILabel!
    
    @IBOutlet weak var total: UILabel!
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    

}

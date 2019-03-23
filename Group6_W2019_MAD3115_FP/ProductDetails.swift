//
//  ProductDetails.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-18.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class ProductDetails: UIViewController {

    
    static var itemname : String!
    static var itemprice : String!
    static var itemdesc : String!
    static var itemimg : String!
    
    var custSession : String? = UserDefaults.standard.string(forKey: "customer")!
    @IBOutlet weak var itemIMG: UIImageView!
    
    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var Description: UITextView!
    
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
    
    
    @IBOutlet weak var textQTY: UITextField!
    
    
    @IBAction func stepperQty(_ sender: UIStepper) {
       textQTY.text =  "\(sender.value)"
    }
    
    @IBAction func addToCartBTN(_ sender: UIButton)  {
     guard var tempqty = Float(self.textQTY.text!)
        else
        {
            return
        }
        do
        {
                try  self.shoppingCart.addCartItem(item_forCart: ProductDetails.itemname , quantity: tempqty)
            
                print("inside block of do")
                
        }
        catch
        {
            print("error in ProductsDet : ", "\(error)")
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        itemIMG.image = UIImage(named: ProductDetails.itemimg)
        itemName.text = ProductDetails.itemname!
        Description.text = ProductDetails.itemdesc!
        itemPrice.text = ProductDetails.itemprice!
        self.textQTY.text = "1"
    }
    

    

}

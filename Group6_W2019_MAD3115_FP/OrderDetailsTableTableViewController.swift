//
//  OrderDetailsTableTableViewController.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-24.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class OrderDetailsTableTableViewController: UITableViewController {

    
    
   
    
    static var order : Orders!
     var custSession : String? = UserDefaults.standard.string(forKey: "customer")!
    var cust : Customer!
    {
        get
        {
            return Customer.usersDictionary[custSession!]?.1
            
        }
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
       self.navigationItem.title = "OrderDetails"
       
    }

    

    override func numberOfSections(in tableView: UITableView) -> Int
    {
      
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(section == 0)
        {
        return OrderDetailsTableTableViewController.order.readItemsFromOrdersArr.count
        }
        else
        {
            return 1
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
         var order = OrderDetailsTableTableViewController.order
               if(indexPath.section == 0)
               {
                
                print(cust.orders.count, "inside cell ", indexPath.row)
                    var cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailsCell", for: indexPath) as! OrderDetailsCell
                
                    cell.ItemImg.image = UIImage(named: order!.readItemsFromOrdersArr[indexPath.row].0 )
                    cell.itemName.text = "\(order!.readItemsFromOrdersArr![indexPath.row].0)"
                    cell.itemQTY.text = "Quantity : \(order!.readItemsFromOrdersArr![indexPath.row].1)"
                    cell.itemPrice.text = "Price : \(Float(Items.read_items[cell.itemName.text!]!).dollar())"
                    cell.itemSubTotal.text = "\((order!.readItemsFromOrdersArr![indexPath.row].1 * Items.read_items[cell.itemName.text!]!).dollar())"
                
                    return cell
                }
               else
               {
                    var cell = tableView.dequeueReusableCell(withIdentifier: "TotalBillingCellTableViewCell", for: indexPath) as! TotalBillingCellTableViewCell
                    var total : Float = 0
                    var subTotal : Float = 0
                    var unitPrice : Float = 0
                
                            for (itemFromCart,quant) in order!.orderItems
                            {
                                for (item, price) in Items.read_items
                                {
                                    if(item.lowercased() == itemFromCart.lowercased())
                                    {   unitPrice = price
                                        subTotal = price*quant
                                        total+=subTotal
                                        break
                                    }
                                }
                             
                                
                            }
                    cell.BillingAmount.text = "Billing amount : \(total.roundedVal().dollar())"
              
                    cell.shippingCharges.text =  "Shipping charges : \(Float(order!.shippingInfo.shippingType.rawValue).dollar())"
                     total += Float(order!.shippingInfo.shippingType.rawValue)
               
                    cell.hstAMT.text = "HST 13% tax : \(Float((total*13)/100).roundedVal().dollar())"
                    total += (total*13)/100
                 
                    cell.totalPayable.text = "final amount to be paid  : \(total.roundedVal().dollar()) "
                    return cell
                }
       
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 200
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
   
        
        
        
        
       
}



//
//  OrderListPage.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-23.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class OrderListPage: UIViewController , UITableViewDelegate , UITableViewDataSource {
   
    
  
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
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cust.orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "OrdersCell", for: indexPath) as! OrdersCell
        cell.orderDate.text = "\(Date())"
        
        let o = self.cust.orders[indexPath.row]
        cell.orderId.text = "Order : \(o.orderId!)"
        
        
        switch(o.getOrderStatus)
        {
        case .PROCESSING :
            cell.orderStatus.text = "OrderStatus : Processing"
        case .DELIVERED :
            cell.orderStatus.text = "Order status : delivered"
        case .OUTFORSHIPPING :
            cell.orderStatus.text = "Order status : outForShipping"
        case .CANCELED :
            cell.orderStatus.text = "Order status : cancelled"
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
   
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        OrderDetailsTableTableViewController.orderId = indexPath.row
//        print("inside .....")
//       // self.performSegue(withIdentifier: "toOrderDetails", sender: nil)
//        self.navigationController?.performSegue(withIdentifier: "toOrderDetails", sender: nil)
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  OrderDetailsTableTableViewController.orderId = indexPath.row
        
        OrderDetailsTableTableViewController.order = cust.orders[indexPath.row]
        print("inside .....")
       var sb = UIStoryboard(name: "Main", bundle: nil)
        var nv = sb.instantiateViewController(withIdentifier: "OrderDetailsTableTableViewController") as! OrderDetailsTableTableViewController
        self.navigationController?.pushViewController(nv, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        print("inside did appear")
        self.tableView.reloadData()
    }
    

}

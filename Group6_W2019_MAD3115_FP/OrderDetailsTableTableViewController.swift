//
//  OrderDetailsTableTableViewController.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-24.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class OrderDetailsTableTableViewController: UITableViewController {

    
    
   
    static var orderId : Int!
    
     var custSession : String? = UserDefaults.standard.string(forKey: "customer")!
    var cust : Customer!
    {
        get
        {
            return Customer.usersDictionary[custSession!]?.1
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cust.orders.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       
        var cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailsCell", for: indexPath) as! OrderDetailsCell
        var order = cust.orders[OrderDetailsTableTableViewController.orderId]
        cell.ItemImg.image = UIImage(named: order.readItemsFromOrdersArr![indexPath.row].0 )
        cell.itemName.text = order.readItemsFromOrdersArr![indexPath.row].0
        cell.itemQTY.text = "\(order.readItemsFromOrdersArr![indexPath.row].1)"
        cell.itemPrice.text = "\(Items.read_items[cell.itemName.text!])"
        cell.itemSubTotal.text = "\((order.readItemsFromOrdersArr![indexPath.row].1 * Items.read_items[cell.itemName.text!]! ))"
        
        return cell
       
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
       
        var total : Float = 0
        var subTotal : Float = 0
        
        var unitPrice : Float = 0
        var order = cust.orders[OrderDetailsTableTableViewController.orderId]
        total += Float(order.shippingInfo.shippingType.rawValue)
        
        return "orderId : \(order.orderId!)\norder status : \(order.getOrderStatus)\ntotal billing amount : "\( total.roundedVal().dollar())"
        Shipping cost : "\( Float(order.shippingInfo.shippingType.rawValue).dollar() )"
        "HST 13% tax : "\(Float((total+Float(order.shippingInfo.shippingType.rawValue)*13)/100).roundedVal().dollar())"
        "final amount to be paid  : \(total.roundedVal().dollar())"
        
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 400
    }
        
        
        
        
       
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}

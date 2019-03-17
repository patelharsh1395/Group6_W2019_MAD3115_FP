//
//  productsPage.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-14.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class productsPage: UIViewController , UITableViewDataSource , UITableViewDelegate{
    
    

    @IBOutlet weak var tableView: UITableView!
    var custSession : String? = UserDefaults.standard.string(forKey: "customer")!
    var items = Items.read_items_arr
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomCell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! CustomCell
        
        cell.itemNAME.text  = self.items[indexPath.row].0
        cell.itemMFG.text = ""
        cell.itemPrice.text = "\(self.items[indexPath.row].1)"
        cell.itemIMG.image = UIImage(named: "\(self.items[indexPath.row].0)")
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toRandom", sender: indexPath)
    }

}

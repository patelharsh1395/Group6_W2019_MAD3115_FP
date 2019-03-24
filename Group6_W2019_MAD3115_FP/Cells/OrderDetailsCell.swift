//
//  OrderDetailsCell.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-23.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class OrderDetailsCell: UITableViewCell {

    
    
    
    
    @IBOutlet weak var ItemImg: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemQTY: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var itemSubTotal: UILabel!
    
    var custSession : String? = UserDefaults.standard.string(forKey: "customer")!
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
            
       
    }
    

}

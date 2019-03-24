//
//  OrdersCell.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-23.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class OrdersCell: UITableViewCell {

    @IBOutlet weak var orderId: UILabel!
    @IBOutlet weak var orderDate: UILabel!
    @IBOutlet weak var orderStatus: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }

}

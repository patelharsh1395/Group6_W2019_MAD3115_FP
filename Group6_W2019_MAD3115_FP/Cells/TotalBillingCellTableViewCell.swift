//
//  TotalBillingCellTableViewCell.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-24.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class TotalBillingCellTableViewCell: UITableViewCell {

    @IBOutlet weak var totalPayable: UILabel!
    @IBOutlet weak var shippingCharges: UILabel!
    @IBOutlet weak var hstAMT: UILabel!
    @IBOutlet weak var BillingAmount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

}

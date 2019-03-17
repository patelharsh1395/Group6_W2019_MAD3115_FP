//
//  CustomCell.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-16.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var itemIMG: UIImageView!
    
    @IBOutlet weak var itemNAME: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var itemMFG: UILabel!
    
    @IBAction func viewdetailsBTN(_ sender: UIButton) throws  {
        
        print("view details", self.itemNAME)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var includedIMG: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setIncludedIMG()
    {
        self.includedIMG.isHidden = false
    }
    func unsetIncludedIMG()  {
        self.includedIMG.isHidden = true
    }
    
}

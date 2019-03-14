//
//  productsPage.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-14.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class productsPage: UIViewController {

    
   // var custSession : Customer? = UserDefaults.standard.string(forKey: "customer") as! Customer
    
    
    @IBAction func logoutBtn(_ sender: UIButton) {
        
      //  custSession = nil
        self.performSegue(withIdentifier: "productsTologin", sender: nil)
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      //  self.title = self.custSession?.customerName
        
        
    }
    

    

}

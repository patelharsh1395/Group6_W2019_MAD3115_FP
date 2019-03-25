//
//  UserDetails.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-25.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class UserDetails: UIViewController {

    
    @IBOutlet weak var name: UITextField!
    
    
    @IBOutlet weak var address: UITextView!
    
    @IBOutlet weak var email: UITextField!
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

        self.name.text = self.cust.customerName
        self.address.text = self.cust.address
        self.email.text = custSession
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

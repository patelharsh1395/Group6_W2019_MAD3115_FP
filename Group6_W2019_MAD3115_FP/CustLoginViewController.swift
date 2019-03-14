//
//  CustLoginViewController.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-14.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class CustLoginViewController: UIViewController {

    @IBOutlet weak var CustUserId: UITextField!
    @IBOutlet weak var CustPass: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        Customer.customerSingleToneObj()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func signInClick(_ sender: UIButton) {
          //  let userdef = UserDefaults.standard
        do
        {
            
       // userdef.set(try Customer.login(userid: CustUserId.text!, pass: CustPass.text!), forKey: "customer")
        self.performSegue(withIdentifier: "toproducts", sender: nil)
        }
        catch
        {
            print("invalid pass")
        }
        
    }
    
    @IBAction func signUpClick(_ sender: UIButton) {
    }
    
}

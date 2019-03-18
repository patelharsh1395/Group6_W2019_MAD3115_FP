//
//  CustLoginViewController.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-14.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class CustLoginViewController: UIViewController {

    
    var alert : UIAlertController?
    @IBOutlet weak var CustUserId: UITextField!
    @IBOutlet weak var CustPass: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        Customer.customerSingleToneObj()
        UserDefaults().removeObject(forKey: "customer")
        print("this is first page")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func signInClick(_ sender: UIButton) {
          //  let userdef = UserDefaults.standard
        self.navigationItem.backBarButtonItem?.title = "Back"
        do
        {
            
            if let _ = try Customer.login(userid: CustUserId.text!, pass: CustPass.text!) ?? nil
            {
                UserDefaults().set(CustUserId.text, forKey: "customer")
                self.performSegue(withIdentifier: "tabbarcont", sender: nil)
            }
            
       
        }
        catch CustomError.INVALID(let text)
        {
            alert = UIAlertController(title: "INVALID" , message: text, preferredStyle: .alert)
            alert?.addAction(UIAlertAction(title: "TryAgain" , style: .default , handler: nil))
             self.present(alert!, animated: true)
        }
        catch
        {
            print("invalid pass")
        }
        
        
    }
    
    @IBAction func signUpClick(_ sender: UIButton) {
        self.navigationItem.backBarButtonItem?.title = "Back"
        self.performSegue(withIdentifier: "ToSignup", sender: nil)
    }
    
}

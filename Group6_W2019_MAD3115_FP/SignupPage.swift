//
//  SignupPage.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-21.
//  Copyright © 2019 com. All rights reserved.
//


// date functionality : https://www.johnxiong.com/2017/02/24/quick-swift-validate-age-using-date-picker/



import UIKit

class SignupPage: UIViewController {

    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var address: UITextView!
    @IBOutlet weak var creditcard: UITextField!
   
    @IBOutlet weak var datePicker: UIDatePicker!
    // Age of 18.
    let MINIMUM_AGE: Date = Calendar.current.date(byAdding: .year, value: -18, to: Date())!;
    
    // Age of 100.
    let MAXIMUM_AGE: Date = Calendar.current.date(byAdding: .year, value: -100, to: Date())!;
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var reenter_pass: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func submitBtn(_ sender: UIButton) {
        
        
        let isValidAge = validateAge(birthDate: datePicker.date);
        if (self.Name.text?.nilOrWhiteSpace() ?? false && self.creditcard.text?.nilOrWhiteSpace() ?? false && self.address.text.nilOrWhiteSpace() ?? false && self.password.text?.nilOrWhiteSpace() ?? false && self.reenter_pass.text?.nilOrWhiteSpace() ?? false && self.email.text?.nilOrWhiteSpace() ?? false )
        {
                        if isValidAge {
                           
                            do{
                                
                                try Customer.register(customerName: self.Name.text!, address: self.address.text! , creaditCardInfo: Int(self.creditcard.text!)!  , userId: self.email.text! , password: self.password.text!, dob:  "\(datePicker.date)" )
                                showAlert(title: "Success", message: "User is registered")
                            }
                            catch CustomError.INVALID(let p)
                            {
                                showAlert(title: "Invalid", message: "\(p)")
                            }
                            catch CustomError.ALREADY_EXIST(let p)
                            {
                                showAlert(title: "Invalid", message: "\(p)")
                            }
                            catch CustomError.EMPTY(let p)
                            {
                                showAlert(title: "Empty", message: "\(p)")
                            }
                            catch
                            {
                                print("\(error)")
                            }
                        }
                        else {
                            showAlert(title: "Invalid", message: "Age should be atleast 18")
                        }
        }
        else
        {
            showAlert(title: "Invalid", message: "No field can be empty")
        }

    }
    func validateAge(birthDate: Date) -> Bool {
        var isValid: Bool = true;
        
        if birthDate < MAXIMUM_AGE || birthDate > MINIMUM_AGE {
            isValid = false;
        }
        
        return isValid;
    }
    
    func showAlert(title: String, message: String) {
       
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert);
        var alertAction : UIAlertAction? = nil
                   if(title == "Success")
                   {
                            alertAction = UIAlertAction(title: "OK", style: .default) { (alert) in

                                
                              self.navigationController?.popViewController(animated: true)
                            }
                    }
                    else
                    {
                            alertAction = UIAlertAction(title: title, style: .default, handler: nil)
                    
                    }
        
        alertController.addAction(alertAction!)
        
        
       self.present(alertController, animated: true, completion: nil);
        
    }
    @IBAction func clearBtn(_ sender: UIButton) {
    }
   

}

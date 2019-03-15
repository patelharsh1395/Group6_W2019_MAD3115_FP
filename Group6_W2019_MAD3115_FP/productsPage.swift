//
//  productsPage.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-14.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class productsPage: UIViewController {

    
    var custSession : String? = UserDefaults.standard.string(forKey: "customer")!
     @IBOutlet weak var NavigationBar: UINavigationItem!
    
    
    
    
    
    
    @IBAction func btnNavigaton(_ sender: Any) {
        self.performSegue(withIdentifier: "toThird", sender: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    

    

}

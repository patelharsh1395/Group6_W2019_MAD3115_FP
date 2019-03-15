//
//  ThirdViewController.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-15.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBAction func logoutBtn(_ sender: UIButton) {
        self.performSegue(withIdentifier: "thirdLogout", sender: nil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

//
//  AboutUs.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by Harsh on 2019-03-23.
//  Copyright © 2019 com. All rights reserved.
//

import UIKit
import WebKit
class AboutUs: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
            
        let localfilePath = Bundle.main.url(forResource: "aboutUs", withExtension: "html");
        let myRequest = NSURLRequest(url: localfilePath!);
        self.webView.load(myRequest as URLRequest);
    }
    

    

}

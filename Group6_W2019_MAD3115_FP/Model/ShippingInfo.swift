//
//  ShippingInfo.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by MacStudent on 2019-03-09.
//  Copyright © 2019 com. All rights reserved.
//

import Foundation


class ShippingInfo : IDisplay
{
    
    static var counter = 0
    var shippingId: Int!
    var shippingType: ShippingType!
    var shippingRegionId: String!
    
    
    
    init( shippingType: ShippingType ,shippingRegionId: String)
    {  ShippingInfo.counter+=1
        self.shippingId = ShippingInfo.counter
        self.shippingType = shippingType
        self.shippingRegionId = shippingRegionId
    }
    
    
    
    func display() -> String {
        var str = ""
        str += " Shipping id : sp\(self.shippingId!) \nShippingType: \(self.shippingType!) \nShippingRegin: \(self.shippingRegionId!)  "
        
        return str
    }
    
    
}

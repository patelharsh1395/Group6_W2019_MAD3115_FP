//
//  FloatEXT.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by MacStudent on 2019-03-09.
//  Copyright © 2019 com. All rights reserved.
//

import Foundation


extension Float
{
    func roundedVal() -> Float
    {
        var temp = self
        temp = temp * 100
        temp.round()
        return Float(temp/100)
    }
    func dollar () -> String
    {
        return "$"+String(self)
    }
}

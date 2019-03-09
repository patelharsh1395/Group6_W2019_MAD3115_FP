//
//  IntEXT.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by MacStudent on 2019-03-09.
//  Copyright © 2019 com. All rights reserved.
//

import Foundation

extension Int
{
    func isValidCard() -> Bool
    {
        var counter = 0
        var temp  = self
        
        while( temp != 0 )
        {   counter+=1
            temp = temp/10
            
        }
        if(counter == 16)
        {
            return true
        }
        return false
    }
}

//
//  CustomError.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by MacStudent on 2019-03-09.
//  Copyright © 2019 com. All rights reserved.
//

import Foundation


enum CustomError : Error
{
    case EMPTY(String)
    case INVALID(String)
    case ALREADY_EXIST(String)
    
}

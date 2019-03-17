//
//  Administrator.swift
//  Group6_W2019_MAD3115_FP
//
//  Created by MacStudent on 2019-03-09.
//  Copyright © 2019 com. All rights reserved.
//


import Foundation


struct Items {
    
    
    fileprivate static  var items = [String:Float]()
    
    
    
    static var read_items_arr : [(String,Float)]
    {
        get
        {
            var temp : [(String,Float)] = []
            for i in Items.items
            {
                temp.append((i.key,i.value))
            }
            return temp
        }
    }
    static var read_items : [String:Float]
    {
        get
        {
            return Items.items
        }
    }
    
    fileprivate static func add_item(item_name : String , price : Float) throws
    {
        if (Items.items.isEmpty)
        {
            Items.items.updateValue(price, forKey: item_name)
        }
            
        else
        {
            for (i,_) in Items.items
            {
                if(i.lowercased() != item_name.lowercased())
                {
                    //print("inside if for item update ")
                    Items.items.updateValue(price, forKey: item_name)
                }
                else
                {
                    throw CustomError.ALREADY_EXIST("\(item_name) already exist")
                }
            }
        }
    }
    
    
    
    
}


class Administrator : User
{
    
    private static var view_orders = [Orders]()
    var adminName : String!
    var email : String!
    static var adminDictionary = [String:(String,Administrator)]()
    
    private init(adminName:String, userid :String , pass : String)
    {
        super.init(password: pass , userId: userid)
        self.adminName = adminName
        self.email = userid
        
    }
    
    func updateCatalog(item_name : String , price : Float)
    {
        if(Items.items.contains(where: { (item,price) -> Bool in
            return item == item_name
        }))
        {
            Items.items[item_name] = price
        }
        
    }
    
    func add_item(item_name : String , price : Float) throws
    {
        if(Items.items.contains(where: { (item,price) -> Bool in
            return item.lowercased() == item_name.lowercased()
        }))
        {
            updateCatalog(item_name: item_name, price: price)
        }
        else
        {
            try  Items.add_item(item_name: item_name, price: price)
        }
        
    }
    static  func add_order(order :  Orders)    {
        
        Administrator.view_orders.append(order)
        
    }
    
    func display() -> String
    {
        var str = ""
        if (!Administrator.view_orders.isEmpty)
        {
            
            
            for ord in Administrator.view_orders
            {
                
                print(ord.calcprice())
                
            }
        }
        else
        {
            str += "the is no order created by customer"
        }
        return str
    }
    
    
    static func register(adminName : String,  userId : String , password : String ) throws -> Bool
    {
        
        if (!userId.isEmpty && !password.isEmpty && !adminName.isEmpty)
        {
            if(userId.isValidEmail())
            {
                if(Administrator.adminDictionary.isEmpty)
                {
                    
                    
                    if(password.isValidPassword())
                    {
                        
                        let admin = Administrator(adminName: adminName, userid: userId, pass: password)
                        Administrator.adminDictionary.updateValue((password, admin), forKey: userId)
                        
                    }
                    else
                    {
                        throw CustomError.INVALID("Password is in invalid format")
                    }
                    
                }
                else
                {
                    if let _ = Administrator.adminDictionary[userId]
                    {
                        throw CustomError.ALREADY_EXIST("\(userId) already exist")
                    }
                    else
                    {
                        
                        
                        if(password.isValidPassword())
                        {
                            
                            let admin = Administrator(adminName: adminName, userid: userId, pass: password)
                            Administrator.adminDictionary.updateValue((password, admin), forKey: userId)
                            
                        }
                        else
                        {
                            throw CustomError.INVALID("Password is in invalid format")
                        }
                    }
                }
            }
            else
            {
                throw CustomError.INVALID("UserId is in invalid format")
            }
            
        }
        else
        {
            throw CustomError.EMPTY("Field cannot be empty")
        }
        return true
    }
    
    
    func removeItem(itemList : String) throws
    {
        if(!Items.items.isEmpty)
        {
            var removed : Bool = false
            for (item,_) in Items.items
            {
                if(itemList.lowercased() == item.lowercased())
                {
                    Items.items.removeValue(forKey: item)
                    removed = true
                    break
                }
            }
            if(!removed)
            {
                throw CustomError.INVALID("product does not exist")
            }
        }
        else
        {
            throw CustomError.EMPTY("Product list is empty")
        }
    }
    
    
    
    
    func updateStatus(ordStatus : OrderStatus , orderId : Int) throws -> String
    {
        var temp = true
        var str = "Status updated to : "
        for TempOrder in Administrator.view_orders
        {
            if(orderId == TempOrder.orderId)
            {
                
                switch (TempOrder.getOrderStatus)
                {
                case .CANCELED :
                    throw CustomError.INVALID("Order status cannot be changes since it is Already in CANCELED state ")
                case .DELIVERED :
                    switch(ordStatus)
                    {
                    case .DELIVERED :
                        str = "It is already in DELIVERED status"
                        temp = false
                        break
                    case .CANCELED, .OUTFORSHIPPING, .PROCESSING :
                        str = "Status cannot be updated to \(ordStatus) because it is in DELIVERED state"
                        temp = false
                        break
                        
                    }
                case .OUTFORSHIPPING :
                    switch(ordStatus)
                    {
                    case .CANCELED, .DELIVERED :
                        TempOrder.updateStatus(orderstat: ordStatus)
                        temp = false
                        str += "\(ordStatus)"
                        break
                        
                    case .OUTFORSHIPPING :
                        str = "Already in OUTFORSHIPPING state"
                        temp = false
                        break
                    case .PROCESSING :
                        str = "Already in OUTFORSHIPPING, cannot be update to PROCESSING state"
                    }
                case .PROCESSING :
                    switch(ordStatus)
                    {
                    case .CANCELED , .OUTFORSHIPPING :
                        TempOrder.updateStatus(orderstat: ordStatus)
                        temp = false
                        str += "\(ordStatus)"
                        break
                    case .PROCESSING :
                        str = "Already in PROCESSING state"
                        temp = false
                        break
                    case .DELIVERED :
                        throw CustomError.INVALID("Cannot be updated to DELIVERED state unless it is updated to OUTFORSHIPPING state ")
                        
                    }
                }
            }
            
        }
        if(temp)
        {
            throw CustomError.INVALID("There is no order with id : \(orderId)")
        }
        return str
    }
    
    
    static func login(userid: String , pass : String) throws -> Administrator
    {
        var admin : Administrator?
        if let _ = Administrator.adminDictionary[userid]
        {
            if(Administrator.adminDictionary[userid]!.0 == pass)
            {
                admin = Administrator.adminDictionary[userid]!.1
            }
            else
            {
                throw CustomError.INVALID("password invalid")
            }
        }
        else
        {
            throw CustomError.INVALID("UserID and password are invalid")
        }
        return admin!
    }
    
    
    
}

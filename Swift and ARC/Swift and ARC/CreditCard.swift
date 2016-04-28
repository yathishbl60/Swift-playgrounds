//
//  CreditCard.swift
//  Swift and ARC
//
//  Created by Yatheesh BL on 11/06/14.
//  Copyright (c) 2014 Robosoft Technologies Pvt. Ltd. All rights reserved.
//

import Foundation

class CreditCard {
    
    let number: Int
    //Credit card is always associated with unique customer
   unowned let cardHolder: Customer
    
    
    init(number:Int, cardHolder: Customer) {
        self.cardHolder = cardHolder
        self.number = number
        
        print("CreditCard #\(number) is being initialized")
    }
    
    deinit {
        print("CreditCard #\(number) is being deinitialized")

    }
}
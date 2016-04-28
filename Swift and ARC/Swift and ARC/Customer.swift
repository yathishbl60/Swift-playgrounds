//
//  Customer.swift
//  Swift and ARC
//
//  Created by Yatheesh BL on 11/06/14.
//  Copyright (c) 2014 Robosoft Technologies Pvt. Ltd. All rights reserved.
//

import Foundation

class Customer {
    
    let name: String
    //customer may or may not have credit card
    var creditCard: CreditCard?
    
    init(name: String) {
        self.name = name
        println("Customer \(name) is being initialized")
    }
    
    deinit {
        println("Customer \(name) is being deinitialized")

    }
}
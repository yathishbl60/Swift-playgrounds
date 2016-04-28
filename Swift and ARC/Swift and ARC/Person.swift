//
//  Person.swift
//  Swift and ARC
//
//  Created by Yatheesh BL on 11/06/14.
//  Copyright (c) 2014 Robosoft Technologies Pvt. Ltd. All rights reserved.
//

import Foundation

class Person {
    
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
        println("\(name) is being initialized")
    }
    
    deinit {
        println("\(name) is being deinitialized")
    }
    
}
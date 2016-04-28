//
//  Apartment.swift
//  Swift and ARC
//
//  Created by Yatheesh BL on 11/06/14.
//  Copyright (c) 2014 Robosoft Technologies Pvt. Ltd. All rights reserved.
//

import Foundation

class Apartment {
    
    let number: Int
    weak var tenant: Person? // weak references must be declared as variables and optional value, to indicate their value can change and weak references are allowed to have "no value" during runtime

    init(number: Int) {
        self.number = number
        print("Appartment \(number) is being initialized")

    }
    
    deinit {
        print("Appartment number # \(number) is being deInitialized")
    }
}

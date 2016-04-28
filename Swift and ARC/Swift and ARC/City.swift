//
//  City.swift
//  Swift and ARC
//
//  Created by Yatheesh BL on 11/06/14.
//  Copyright (c) 2014 Robosoft Technologies Pvt. Ltd. All rights reserved.
//

import Foundation

class City {
    let name: String
    unowned let country: Country
    
    init(name: String, country: Country) {
        self.name = name
        self.country = country
        
        println("City \(name) and country \(country.name) is being initialized")
        
    }
    
    deinit {
       // println("City \(name) and country \(country.name) is being deinitialized") /* will crash */
        println("City \(name) is being deinitialized")

    }
    
}
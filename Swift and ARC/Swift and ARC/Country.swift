//
//  Country.swift
//  Swift and ARC
//
//  Created by Yatheesh BL on 11/06/14.
//  Copyright (c) 2014 Robosoft Technologies Pvt. Ltd. All rights reserved.
//

import Foundation

class Country {
    let name: String
    let capitalCity: City!
    
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
        
        print("Country \(name) and capitalCity \(capitalCity.name) is being initialized")
    }
    
    deinit {
       print("Country \(name) and capitalCity \(capitalCity.name) is being deinitialized")

    }
}
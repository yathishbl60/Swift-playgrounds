//
//  HTMLElement.swift
//  Swift and ARC
//
//  Created by Yatheesh BL on 11/06/14.
//  Copyright (c) 2014 Robosoft Technologies Pvt. Ltd. All rights reserved.
//

import Foundation

class HTMLElement {
    
    let name: String
    let text: String?
    
    @lazy var asHTML: () -> String = {
        
        //comment below line creates reference cycle
        [unowned self] in //capture self as an unowned reference rather than a strong reference
        //[unowned self, weak otherObject] -> its a captured list
        
        
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "</\(self.name)>"
            
        }
    }

    @lazy var asHTML_: () -> String? = {
        
        //comment below line creates reference cycle
        [weak self] in //capture self as an unowned reference rather than a strong reference
        //[weak self, weak otherObject] -> its a captured list
        

        if let text = self?.text {
            return "<\(self?.name)>\(text)</\(self?.name)>"
        } else {
            return "</\(self?.name)>"
            
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        println("\(name) is being deinitialized")
    }
}
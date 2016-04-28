//
//  ViewController.swift
//  Swift and ARC
//
//  Created by Yatheesh BL on 11/06/14.
//  Copyright (c) 2014 Robosoft Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ARC in action
        var reference1: Person?
        var reference2: Person?
        var reference3: Person?
        
        reference1 = Person(name: "Jhon") // 1 strong reference to Person instance
        
        reference2 = reference1 // 2 strong reference to Person instance
        reference3 = reference1 // 3 strong reference to Person instance
        
        
        reference2 = nil // 2 strong reference to Person instance
        reference3 = nil // 1 strong reference to Person instance
        
        reference1 = nil // 0 strong reference to Person instance
        
        
        
        // Strong reference cycle : remove weak reference in Apertment Class to generate reference cycle
        var jhon: Person?
        var number70: Apartment?
        
        jhon = Person(name: "jhon")
        number70 = Apartment(number: 70)
        
        
        jhon!.apartment = number70
        number70!.tenant = jhon
        
        jhon = nil
        
        println("\(number70?.tenant?.name)") // number70.tenant is set to nil after jhon is deallocated because it is a weak reference
        
        number70 = nil

         // Note that neither deinitializer was called when you set these two variables to nil. The strong reference cycle prevents the Person and Apartment instances from ever being deallocated, causing a memory leak in your app.
        
        
        
        // Unowned references: assumes always have a value
        
        var jhony: Customer?
        jhony = Customer(name: "Jhony")
        jhony!.creditCard = CreditCard(number: 1000, cardHolder: jhony!)
        
        jhony = nil
        
        //Unowned References and Implicitly Unwrapped Optional Properties
        
        var country: Country? = Country(name: "India", capitalName: "Delhi")
        country = nil
        
        
        // Strong reference cycle for closure
        var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hello world")
        
        let asHTML = paragraph?.asHTML // reference cycle created
        
        println(asHTML)
        
        paragraph = nil
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


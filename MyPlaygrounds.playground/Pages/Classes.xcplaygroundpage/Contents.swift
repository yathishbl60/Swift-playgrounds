// Playground - noun: a place where people can play

import Foundation

// Header #import "Vehicle.h" not required

class Vehicle { // Universal Base class if not provided
    //properties
    //methods
    //initializers
    
    var numberOfWheels = 0 // Define a property
    
    //Computed Properties
    var description: String {
        get {
            return "\(numberOfWheels) wheels"
        }
    }
}


// Creating Instance
//let someVehicle: Vehicle = Vehicle()
let someVehicle = Vehicle()

// Accessing properties
someVehicle.numberOfWheels
someVehicle.description

someVehicle.numberOfWheels = 2
someVehicle.description



// SubClassing

class Bicycle: Vehicle {
    
    override init() // initializer  wont return any value
    {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
bicycle.description




// Overriding a property

// SubClassing

class Car: Vehicle {
    var speed = 0.0
    override init() // initializer  wont return any value
    {
        super.init()
        numberOfWheels = 4
    }
    
    override var description: String {
        return (super.description) + " and speed = \(speed) mph"
    }
}

let newCar = Car()
newCar.description

newCar.speed = 100.0
newCar.description


//Property Observers
/* willSet and didSet observers are not called when a property is first initialized. They are only called when the property’s value is set outside of an initialization context */

class ParentsCar: Car {
    override var speed: Double {
        willSet {
            // called just before the value is stored
            
            if newValue > 65.0 {
                print("Care Full")
            }
        }
        didSet {
            // called immediately after the new value is stored
            oldValue
        }
    }
}



// Methods
class Counter {
    var count = 0
    
    func incrementBy(amount: Int) {
        count += amount
    }
    
    func resetCounter(count: Int) {
        self.count = count // when parameter name same as property name use self.
    }
}

var counter = Counter()
counter.incrementBy(100)
counter.resetCounter(9)


/**** Classes are reference type ****/
var anotherCounter = counter
anotherCounter.incrementBy(9999)
counter // counter count property value also chaged because both counter and anotherCounter object holds the same reference



/***  Identity operators : “Use these operators to check whether two constants or variables refer to the same single instance ***/

if counter === anotherCounter {
    "Both counter and anotherCounter reference to same Counter instance."
}

var oneMoreCounter = Counter()
if counter !== oneMoreCounter {
    "Both counter and anotherCounter reference to different Counter instance."
}



// Lazy stored properties: property whose initial values is not calculated untill the first time it is used

class DataImporter {
    /*
     DataImporter is a class to import data from an external file.
     The class is assumed to take a non-trivial amount of time to initialize.
     */
    var fileName = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data += ["Some data"]
manager.data += ["Some more data"]
// the DataImporter instance for the importer property has not yet been created

manager.importer.fileName //DataImporter instance for the importer is now initialized




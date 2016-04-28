// Playground - noun: a place where people can play

import Foundation

//*** Generics function
func swapTwoValues<T>(inout a: T, inout b: T) {
    
    let tempA = a
    a = b
    b = tempA
}


var string1 = "String 1"
var string2 = "String 2"

swapTwoValues(&string1, b: &string2)

string1
string2


var int1 = "Int 1"
var int2 = "Int 2"

swapTwoValues(&int1, b: &int2)

int1
int2


//*** generic types

struct Stack<T> {
    
    var items = [T]()
    
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T? {
        if items.isEmpty {
            return nil
        }
        return items.removeLast()
    }
    
}


var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")

stackOfStrings.items
// the stack now contains 4 strings”

stackOfStrings.pop()
stackOfStrings.pop()
stackOfStrings.pop()
stackOfStrings.pop()


//**** Type Constraints : Type constraints specify that a type parameter must inherit from a specific class, or conform to a particular protocol or protocol composition.
func findIndex<T: Equatable>(array: [T], valueToFind: T) -> Int? {
    
    for (index, value) in array.enumerate() {
        
        if value == valueToFind {
            
            return index
        }
    }
    
    return nil
}

let doubleIndex = findIndex([3.14159, 0.1, 0.25], valueToFind: 9.3)
let stringIndex = findIndex(["Mike", "Malcolm", "Andrea"], valueToFind: "Andrea")


// *** Associated type
protocol Container {
    
    associatedtype ItemType
    
    mutating func append(item: ItemType)
    
    var count: Int { get }
    
    subscript(i: Int) -> ItemType { get }
    
}




struct IntStack: Container {
    
    // original IntStack implementation
    var items = [Int]()
    
    mutating func push(item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    // conformance to the Container protocol
    typealias ItemType = Int
    
    mutating func append(item: Int) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}





struct GStack<T>: Container {
    
    // original Stack<T> implementation
    var items = [T]()
    
    mutating func push(item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
    
    // conformance to the Container protocol
    mutating func append(item: T) {
        self.push(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> T {
        return items[i]
    }
}



// *** Extending an existing type to specify an associated type

extension Array: Container {}


// Where Clause

func allItemsMatch<
    C1: Container, C2: Container
    where C1.ItemType == C2.ItemType, C1.ItemType: Equatable
    >(someContainer: C1, anotherContainer: C2) -> Bool {
    
    if someContainer.count != anotherContainer.count {
        
        return false
    }
    
    for i in 0 ..< someContainer.count {
        
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    return true
}

var stackOfStrings_ = GStack<String>()
stackOfStrings_.push("uno")
stackOfStrings_.push("dos")
stackOfStrings_.push("tres")

var arrayOfStrings = ["uno", "dos", "tres"]

if allItemsMatch(stackOfStrings_, anotherContainer: arrayOfStrings) {
    "All items match."
} else {
    "Not all items match."
}





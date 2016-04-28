// Playground - noun: a place where people can play

import Foundation

//extension CGSize {
//    mutating func increaseByFactor(factor: Int) {
//        width *= factor
//        height *= factor
//    }
//}


extension Int {
    
    func reputations(task: () -> ()) {
        for _ in 0..<self {
            task()
        }
    }
}

100.reputations(){print("Hello")}


// *****  Generics

struct Stack<T> {
    var elements = [T]()
    
    mutating func push(element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T {
        return elements.removeLast()
    }
}


var intStack = Stack<Int>()
intStack.push(1000)
intStack
let lastIn = intStack.pop()


var stringStack = Stack<String>()
stringStack.push("Hello")
stringStack
stringStack.pop()




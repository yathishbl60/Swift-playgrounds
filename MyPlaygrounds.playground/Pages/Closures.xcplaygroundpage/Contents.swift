// Playground - noun: a place where people can play

import Foundation

/*  Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C .Closures can capture and store references to any constants and variables from the context in which they are defined */

/*
 Global functions are closures that have a name and do not capture any values.
 Nested functions are closures that have a name and can capture values from their enclosing function.
 Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context”
 */

/* Closure Expression Syntax:
 
 
 { (parameters) -> returnType in
 statements
 }
 
 
 */

func repeatByCount(count: Int, task: () -> ())  {
    
    for _ in 0..<count {
        task()
    }
}

repeatByCount(4, task: {() -> Void in print("Hello")
})

// or

repeatByCount(4, task: { print("Hello")
})




var names = ["Michal", "Jucker", "Steve", "Job"]
var reversed = names.sort( { (string1: String, string2: String) -> Bool in
    return string1 > string2
})

reversed

// Inferring type from the Context
reversed = names.sort( { string1, string2 in
    return string1 > string2
})

//Implicit returns from Single Expression closures
names.sort( { string1, string2 in
    string1 > string2
})


//Shorthand arguments names
reversed = names.sort( {$0 > $1} )


// Operator Functions
reversed = names.sort( > )



/*
 // *** Trailing Closures *** //
 
 If you need to pass a closure expression to a function as the function’s final argument and the closure expression is long, it can be useful to write it as a trailing closure instead. A trailing closure is a closure expression that is written outside of (and after) the parentheses of the function call it supports:
 */


func someFunctionThatTakesAClosure(closure: () -> ()) {
    // function body goes here
}
// here's how you call this function without using a trailing closure:
someFunctionThatTakesAClosure({
    // closure's body goes here
})
// here's how you call this function with a trailing closure instead:
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

reversed = names.sort( { $0 > $1 } )


//***  Capturing Values : A closure can capture constants and variables from the surrounding context in which it is defined


func makeIncrementor(forIncrement amount: Int)  -> ()-> Int{
    var runningTotal = 0
    
    func incrementor() -> Int {
        runningTotal += amount
        return runningTotal
    }
    
    return incrementor
}

let incrementByTen = makeIncrementor(forIncrement: 10)

incrementByTen()
incrementByTen()
incrementByTen()


//** closures are reference Types
let alsoIncrementByTen = incrementByTen

alsoIncrementByTen()



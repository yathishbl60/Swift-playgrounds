// Playground - noun: a place where people can play

import Foundation

// For loop

let base = 3
let power = 10
var answer = 1

// ignoring the values by using an underscore in place of variable name
for _ in 1...power {
    answer *= base
}
"\(base) to the power of \(power) is \(answer)"
// prints "3 to the power of 10 is 59049”


// *** Switch

/*
 1. No implicit fallthrough : entire switch statement finishes its execution as soon as the first matching switch case is completed , So break statment is not required
 
 2. The body of each case must contain atleast one executable statement
 i.e
 case "a":
 case "A":print("A")
 is Invalid
 
 3. Multiple matches for a single switch case can be separated by comma
 i.e
 case "a", "A": print("A")
 
 */

// ** Range Matching

let count = 3_000_000_000_000
let countedThings = "stars in the Milky Way"
var naturalCount: String

switch count {
case 0:
    naturalCount = "no"
case 1...3:
    naturalCount = "a few"
case 4...9:
    naturalCount = "several"
case 10...99:
    naturalCount = "tens of"
case 100...999:
    naturalCount = "hundreds of"
case 1000...999_999:
    naturalCount = "thousands of"
default:
    naturalCount = "millions and millions of"
}

"There are \(naturalCount) \(countedThings)."


// ** Tuples

let somePoint = (1, 1)

switch somePoint {
case (0, 0):
    "(0, 0) is at the origin"
case (_, 0): // matches any value in x
    "(\(somePoint.0), 0) is on the x-axis"
case (0, _):
    "(0, \(somePoint.1)) is on the y-axis"
case (-2...2, -2...2):
    "(\(somePoint.0), \(somePoint.1)) is inside the box"
default:
    "(\(somePoint.0), \(somePoint.1)) is outside of the box"
}

// ** Value Bindings

let anotherPoint = (2, 0)

switch anotherPoint {
case (let x, 0):
    "on the x-axis with an x value of \(x)"
case (0, let y):
    "on the y-axis with a y value of \(y)"
case let (x, y):
    "somewhere else at (\(x), \(y))"
}

// ** Where
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    "(\(x), \(y)) is on the line x == y"
case let (x, y) where x == -y:
    "(\(x), \(y)) is on the line x == -y"
case let (x, y):
    "(\(x), \(y)) is just some arbitrary point"
}


// ** Controll trnsfer statements
/*
 1. continue
 2. break
 3. fallthrough
 4. return
 */

// fallthrough : Entire switch statement finishes its execution as soon as the first matching switch case is completed.

//  making switch to fallthrough all cases like C
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
description




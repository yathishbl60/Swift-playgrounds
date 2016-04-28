// Playground - noun: a place where people can play

import Foundation

// Declaring Constant
let maxLimit = 100

// Declaring variable
var currentValue = 10


// Type annotation

var alertMessage: String // Should initialize with a value to determine type or explicitly provide type annotation otherwise compiler gives error

// Naming constants and variables

let π = 3.1412

// u can give const or variable the same name as reserved Swift keyword enclosed in ` .
var `String` = "Reserved Swift word"


// Printing

print(π) // Print on the console with LineBreak

print(π) // Print on the console without LineBreak


// using String interpolation to include the name of a constant or variables as a placeholder in a longer string


print("PI Value  = \(π)") // will print PI Value = 3.1412


// Semicolons are needed when u want to write multiple separate statements on a single line
let PI = 3.1412; print(PI)


/* Integers
 /* Int - singned integer */
 /* UInt - unsigned integer */
 */

// Integer bounds

let minValue = UInt8.min
let maxValue = UInt8.max


//Numeric Literals
let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

/**** Type Conversion ****/

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
// pi equals 3.14159, and is inferred to be of type Double



/**** Type aliase ***/

typealias AudioSampleRate = UInt16

var maxRate = AudioSampleRate.max


// Swift’s type safety prevents non-Boolean values from being be substituted for Bool

let i = 1

if i == 1 { // if i { gives an error
    
}


/***** Tuples *****/
//“a tuple of type (Int, String)”
let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")”


//You can decompose a tuple’s contents into separate constants or variables, which you then access as usual:
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// prints "The status code is 404"
print("The status message is \(statusMessage)")
// prints "The status message is Not Found"


//If you only need some of the tuple’s values, ignore parts of the tuple with an underscore (_) when you decompose the tuple:
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// prints "The status code is 404"



//Alternatively, access the individual element values in a tuple using index numbers starting at zero:
print("The status code is \(http404Error.0)")
// prints "The status code is 404"
print("The status message is \(http404Error.1)")
// prints "The status message is Not Found”


//You can name the individual elements in a tuple when the tuple is defined:
let http200Status = (statusCode: 200, description: "OK")
//If you name the elements in a tuple, you can use the element names to access the values of those elements:

"The status code is \(http200Status.statusCode)"
// prints "The status code is 200"
"The status message is \(http200Status.description)"
// prints "The status message is OK"



/*** Optionals ***/

/* “says:
 There is a value, and it equals x
 or
 There isn’t a value at all" */

var possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber is inferred to be of type "Int?", or "optional Int”
// Int?  Indicates value it contains is optional


/**** If statement and Forced unwrapping **/

if (convertedNumber != nil) {
    "\(possibleNumber) has an integer value of \(convertedNumber!)"
} else {
    "\(possibleNumber) could not be converted to an integer"
}
// prints "123 has an integer value of 123"



/***** Implicitly Unwrapped Optionals *****/
//an optional will always have a value, after that value is first set

let possibleString: String? = "An optional string."
possibleString! // requires an exclamation mark to access its value
// prints "An optional string."

let assumedString: String! = "An implicitly unwrapped optional string."
assumedString  // no exclamation mark is needed to access its value
// prints "An implicitly unwrapped optional string.”

var responseCode: Int? = 100
responseCode = nil

// nil cannot be used with non-optional constants and variables.
/* uncomment to test
 var responseData = 100
 responseData = nil */



/**** Basic Operators ***/

var (x, y) = (100,200) // operating with tuples
x
y

/* uncoment
 if x = y {
 // this is invalid because x = y doesn't return a value
 }
 */


/**** Range Operators *****/
// Swift includes two range operators : closed-range operator(a...b) and half-closed range operator(a..b)

//closed-range operator(a...b)  ==> a to b including values a and b
for index in 1...4 {
    "called \(index+1) times"
}

//half-closed range operator(a..b) ==> a to b doesn’t include b
for index in 1..<4 {
    "called \(index+1) times"
}


/**** Strings and characters *****/

/* Swift’s String type is a value type. If you create a new String value, that String value is copied when it is passed to a function or method, or when it is assigned to a constant or variable. In each case, a new copy of the existing String value is created, and the new copy is passed or assigned, not the original version */

var newString = "Dog!🐶"

newString.characters.count
newString.utf16.count

//Note that the character count returned by countElements is not always the same as the length property of an NSString that contains the same characters. The length of an NSString is based on the number of 16-bit code units within the string’s UTF-16 representation and not the number of Unicode characters within the string. To reflect this fact, the length property from NSString is called utf16count when it is accessed on a Swift String value.


// Initializing an empty string

var emptyString = ""

// string mutability
emptyString += "New"

// ** Strings are value types
var firstString = "First"
var secondString = firstString

firstString += " Modified"

secondString
//Swift’s compiler optimizes string usage so that actual copying takes place only when absolutely necessary





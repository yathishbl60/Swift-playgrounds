// Playground - noun: a place where people can play

import Foundation


func sayHello(personName: String) -> String {
    return "Hello " + personName + " !"
}

sayHello("Tim")


// Function with multiple reurn values
func count(string: String) -> (vowels: Int, consonants: Int, others: Int) {
    var vowels = 0, consonants = 0, others = 0
    
    for character in string.characters {
        switch String(character).lowercaseString {
        case "a", "e", "i", "o", "u":
            vowels += 1
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
             "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            consonants += 1
        default:
            others += 1
        }
    }
    return (vowels, consonants, others)
}

let total = count("wewrwerosdf#@$@$");
"vowels count = \(total.vowels), consonants count = \(total.consonants), others = \(total.others)"



// Function parameters name

func join(string1: String, string2:String, joiner:String) -> String {
    // function body goes here, and can use parameterName
    // to refer to the argument value for that parameter
    return string1 + joiner + string2
}
join("Hello", string2: "world", joiner: " ")




// External parameters name
func join(string string1: String, to string2:String, withJoiner joiner:String) ->String {
    // function body goes here, and can use parameterName
    // to refer to the argument value for that parameter
    return string1 + joiner + string2
}

join(string: "Hello", to: "World", withJoiner: " ")



// ShortHand External parameter names

func containsCharacter(string string: String, characterToFind characterToFind:Character) -> Bool {
    
    for character in string.characters {
        
        if character == characterToFind {
            return true
        }
    }
    return false
}

containsCharacter(string: "qwerty", characterToFind: "e")
containsCharacter(string: "qwerty", characterToFind: "c")



// Default parameter Values
func join(string string1: String, toString string2:String, withJoiner joiner:String = " ") ->String {
    // function body goes here, and can use parameterName
    // to refer to the argument value for that parameter
    return string1 + joiner + string2
}
join(string: "Hello", toString: "World", withJoiner: "_")
join(string: "Hello", toString: "World")



//External name with parameter for default values
func join(s1: String, s2: String, joiner: String = " ") -> String {
    return s1 + joiner + s2
}

join("Hello", s2: "World", joiner: " ->")



//*** Variadic parameters

func arithmeticMean(numbers: Double...) -> Double { // same as Double[]
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8, 19)



//***** Constant and Variable Parameters
/*
 1. function parameters are constant by default
 2. You can avoid defining a new variable within a function by specifying parameter as variable parameter which gives a new modifiable copy of the parameter value
 */
func add<T>(object: T, toArray: [T]) -> [T] {
    
    var array = toArray
    array.append(object)
    
    return array
}

add(40, toArray: [10,2,23])





// *** In-Out paramertes
func swapTwoInts(inout a: Int, inout b: Int) {
    
    let tempA = a
    a = b
    b = tempA
}

var a = 100
var b = 200
swap(&a, &b)
"value of a after swap = \(a)"
"value of a after swap = \(b)"



//**** Nested Functions
//you can aslo define functions inside the bodies of the other functions


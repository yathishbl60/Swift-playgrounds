// Playground - noun: a place where people can play

import Foundation

// Swift provides twoo Collection types 1. Arrays and 2. Dictionaries

// ****** Arrays

//var shoppingList:String[] = ["Milk", "Fruits"]

var shoppingList = ["Milk", "Fruits"] // type is infered from items


shoppingList.count // number of elements in array

// Adding elements
shoppingList += ["Vegetables", "Perfumes"]
shoppingList.append("Cloths")
shoppingList[0] = "Cheese"
shoppingList[1...2] = ["Cake","Chocolate"]

shoppingList

//Removing Elements
shoppingList.removeAtIndex(0)

shoppingList


//Iterating array

for item in shoppingList {
    "\(item)"
}

//iterating with index
for (index, value) in shoppingList.enumerate() {
    "\(index) , \(value)"
}


// Creating empty array

var someInts = [Int]()

// Initialize Array of certain size and with default value
var threeInts = [Int](count: 3, repeatedValue: 3)
var fiveInts = Array(count:5, repeatedValue: 5)

var eightInts = threeInts + fiveInts


// ****** Dictionaries
// Dictionary keyType can be any kind but it must be hashable
//var airports:Dictionary<String, String> = ["TYO": "Tokyo", "IND":"India"]
var airports = ["TYO": "Tokyo", "IND":"India"]

// Iterating

for (airportCode, airportName) in airports {
    "\(airportCode) , \(airportName)"
}

// can get only keys or values


// Creating an Empty Dictionary

var nameOfIntegers = Dictionary<Int, String>()

nameOfIntegers[10] = "Ten"

nameOfIntegers = [:]


// Mutability of collections

var someArray = ["one", "Two" , "Three"] // immutable array

//someArray += "Four"

someArray[0] = "1" // still modify array object without changing the size of the array

someArray






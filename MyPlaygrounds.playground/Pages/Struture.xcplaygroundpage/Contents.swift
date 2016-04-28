// Playground - noun: a place where people can play

import Foundation

struct Point {
    var x,y: Double
}


struct Size {
    var width,height: Double
}


struct Rect {
    var origin: Point
    var size: Size
    
    //computed properties: which donot actually store a value
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
            
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
            
        }
        //    set {
        //        origin.x = newValue.x - (size.width / 2)
        //        origin.y = newValue.y - (size.height / 2)
        //
        //    }
    }
    
    
    // Read-Only computed properties
    var area: Double {
        return size.width * size.height
    }
    
    
    //methods in struct
    func isBiggerThanRect(other: Rect) -> Bool {
        return self.area > other.area
    }
}


//Memberwise Initializers for structure type: All structures have an automatically generated memberwise initializers.
var point = Point(x: 0.0, y: 0.0)
var size = Size(width: 320.0, height: 560.0)
var rect = Rect(origin: point, size: size)


//Unlike Objective-C, Swift enables you to set subproperties of a structure proprty directly.
rect.size.width = 200.0




/**** Structures and enumerationsare Value types
 All the basic types in Swift - integers, floating-point numbers, Booleans, strings, arrays and dictionaries are value types ****/

var pointA = Point(x: 13.0, y:45.0)
var pointB = pointA
pointB.x = 0.5
pointA // value of x not chaged because it is a separate copy




// *** Const and variables : Value types

var point1 = Point(x: 0.0, y: 0.0)
point1.x = 10.0

//*** error : Can't mutate a constant
let point2 = Point(x: 12.0, y: 0.0)
//point2.x = 10.0



// Mutating a Structure

struct MutatablePoint {
    var x,y: Double
    
    mutating func moveToTheRightBy(dx: Double) {
        x +=  dx
    }
}

let point3 = MutatablePoint(x: 12.0, y: 0.0)
//*** error : Can't mutate a constant: uncomment to see
//point3.moveToTheRightBy(18)



/*** Assignment and Copy Behaviours for arrays ***/
var a = [1,2,3]
var b = a
var c = a

// if you set a[0] = 100 without modifying the length of the array .“Note that the array is not copied when you set a new value with subscript syntax

a[0] = 100
b[0]
c[0]

// However, if you append a new item to a, you do modify the array’s length. This prompts Swift to create a new copy of the array at the point that you append the new value. Henceforth, a is a separate, independent copy of the array
a.append(999)
a[0] = 111
b[0]
c[0]


//*** Enusuring that array is unique
// now b and c both reference the same array.Call the unshare method on b to make it become a unique copy

//b.unshare() // unshare method can't be called on constant array
b[0] = 333
c[0] //Note that b[0] and c[0] are not same because you unshared b (created an unique copy of b)



// *** Checking Whether two arrays share the same elements
if b == c {
    "b and c both reference to same instance"
}

if b[0...1] == b[0...1] {
    "These two subarrays share the same elements"
}
else
{
    "These two subarrays donot share the same elements"
}



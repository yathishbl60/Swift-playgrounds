// ********************************** Enumeration ************************* //

import Foundation

//“Use enum to create an enumeration. Like classes and all other named types, enumerations can have methods associated with them.”

enum Rank: Int {
    
    //Raw value type of enumeration is Int, So you have to specify the first row value otherwise compiler will give error .
    case Ace = 1
    
    // The rest of the raw values are assigned in order.
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack = 100, Quen, King = 122
    
    func simpleDescription() -> String {
        switch self {
            
        case .Ace:
            return "ace"
            
        case .Jack:
            return "jack"
            //“Inside the switch, the enumeration is referred to by the abbreviated form .Hearts because the value of self is already known to be a suit. You can use the abbreviated form anytime the value’s type is already known.”
            
        case .Quen:
            return "quen"
            
        case .King:
            return "king"
            
        case .Two, .Three:
            return "Number 2 or 3"
            
        default:
            return String(self.rawValue)
        }
    }
    
    func compareWith(value: Rank) -> Bool {
        return self.rawValue > value.rawValue
    }
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue

ace.simpleDescription()

Rank.Two.simpleDescription()
Rank.Three.simpleDescription()

let king = Rank.King

Rank.Jack.rawValue // Enum with asigned values
Rank.Quen.rawValue
Rank.King.rawValue

Rank.Two.rawValue
Rank.Three.rawValue


king.compareWith(ace) // calling enum with method


let convertedRaw = Rank(rawValue: 5) // value is optional

if (convertedRaw != nil) {
    
    convertedRaw!.simpleDescription() // forcibily unwrapping using ! , ensure by checking for nil before unwrapping
    
}

if let convertedRank = Rank(rawValue: 3) {
    
    convertedRank.simpleDescription()
}



enum Suit {
    
    case Spades, Hearts, Diamonds, Clubs
    
    func simpleDescription() -> String {
        
        switch self {
            
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
            
        }
    }
}



//****** You can also use string or floating numbers



// Enum with string

enum RTAppNotification: String {
    
    case RTAppNotificationBecomeActive = "AppNotificationBecomeActive"
    case RTAppNotificationBecomeInActive = "AppNotificationBecomeInActive"
}




// ********************************** Structs ************************* //
// “Use struct to create a structure. Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.”

struct Card {
    
    var rank: Rank // should explicitly typecast
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades) // since instance var is typecasted can directly get variables using "." notaion as (.Three) OR u can use Rank.Three
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


//“An instance of an enumeration member can have values associated with the instance. Instances of the same enumeration member can have different values associated with them. You provide the associated values when you create the instance. Associated values and raw values are different: The raw value of an enumeration member is the same for all of its instances, and you provide the raw value when you define the enumeration.”

enum ServerResponse {
    case Result(String, String)  // (String,String) ==> associated values for an instance .
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
    
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
    
case let ServerResponse.Error(error):
    let serverResponse = "Failure...  \(error)"
}


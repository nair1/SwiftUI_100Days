import Cocoa

//----------------------------------------------
//HOW TO HANDLE MISSING DATA WITH OPTIONALS

let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposite = opposites["Peach"] // what happens here? --> type String?, it's nil

//if the optional has a value inside
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
} else {
    print("null opposite for mario")
}

func square(number: Int) -> Int {
    return number * number
}

var test: Int? = nil

if let test = test { // temporarily creating a second constant of "test"
    print(square(number: test))
}



//----------------------------------------------
//HOW TO UNWRAP OPTIONALS WITH GUARD

func printSquare(of number: Int?) {
    //guard let does the opposite of if let, only runs if the condition is false
    //using early returns rather than nested conditions
    guard let number = number else {
        print("missing number")
        return
    }
    
    print("number ^ 2 is \(number * number)")
}

//swift requires you to exit a function if the guard fails
//if the check passes, and the optional has a value inside, it's automatically unwrapped



//----------------------------------------------
//HOW TO UNWRAP OPTIONALS WITH NIL COALESCING

let captains = [
    "cap1": "Captain1",
    "cap2": "Captain2",
    "cap3": "Captain3"
]

var cap4 = captains["cap4"] ?? "N/A" // stored as N/A if value is nil
cap4 = captains["cap4", default: "N/A"] // same as doing this, but works for things other than dicts too\

let tvShows = [String]()
let randomShow = tvShows.randomElement() ?? "N/A"



//----------------------------------------------
//HOW TO HANDLE MULTIPLE OPTIONALS WITH OPTIONAL CHAINING

let names = ["name1", "name2", "name3"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("next in line: \(chosen)")



//----------------------------------------------
//HOW TO HANDLE FUNCTION FAILURE WITH OPTIONALS

enum UserError: Error {
    case badID, networkFailure
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailure
}

//try? allows us to return an optional nil if any error was thrown inside the throwing function
if let user = try? getUser(id: 1) {
    print("User: \(user)")
}

let user2 = (try? getUser(id: 23)) ?? "N/A"



//----------------------------------------------
//SUMMARY: OPTIONALS

//optionals let us store the absence of data (nil)
//as a result, everything that is non-optional definitely has a value inside
//unwrapping an optional is the process of sending a value back if it exists
//if let runs code if optional has value, guard let runs code if optional doesn't have value
//guard let requires us to exit or throw error
//?? unwraps and returns value, or returns default value
//optional chaining reads an optional inside another optional
//try? can convert throwing functions to return an optional

import Cocoa

//----------------------------------------------
//TYPE ANNOTATIONS

let surname: String = "Lasso"
var score: Double = 0
var albums: [String] = ["Red", "Fearless"]

var user: [String: String] = ["id": "@sachinn25"]

var books: Set<String> = Set([
    "The Bluest Eye"
])

var teams: [String] = []
teams = [String]() // this does the same thing

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light
style = .dark

var style2: UIStyle = .dark

//when should you use type annotations?
//use type inference as much as possible
//eg, being explicit after the equal sign

let username: String
//lots of complex logic
username = "@sachinn25"
//username = "sdf" -- not allowed, can't reassign a let

//let scores: Int = "Zero" -- not allowed, types don't match



//----------------------------------------------
//Summary: Complex Data

//arrays store many values, and read them with indices
//must all be of the same type

//dictionaries store many values, and read them using keys we specify
//all keys must be the same type, and all values must be the same type

//sets store many values, but we don't choose their order

//enums let us create our own types to specify a range of acceptable values

//Swift uses type inference to figure what type of data we're storing
//You can use type annotations to force a particular type

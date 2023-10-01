import Cocoa

//----------------------------------------------
//VARIABLES

//can change over time
var greeting = "Hello, playground"
greeting = "Hi!"
greeting = "hello"

//cannot change over time
let character = "Norman"

var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)



//----------------------------------------------
//STRINGS

let actor = "Denzel Washington"
let filename = "paris.jpg"
let result = "You \"win\"!" // escape double quotes

let movie = """
A day in
the life of an
Apple engineer
"""

let actorLength = actor.count
let resultUppercased = result.uppercased()
let movieHasPrefix = movie.hasPrefix("A day")
let filenameHasSuffix = filename.hasSuffix(".jpg")



//----------------------------------------------
//STORING WHOLE INTEGERS

//storing ints
let score = 10
let reallyBig = 100000000 // hard to read without commas
let readableBig = 10_000_000 // use underscores to make num readable

//arithmetic operators
let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2

//modify operators
var counter = 10
counter = counter + 5
counter += 5
print(counter)

counter *= 2
counter -= 10
counter /= 2

//int methods
let number = 120
print(number.isMultiple(of: 3))
print(120.isMultiple(of: 3))


//----------------------------------------------
//STORING DECIMAL NUMBERS

//decimals are problematic in code since we have to approximate
//here's an example
let errorNumber = 0.1 + 0.2
print(errorNumber)

let a = 1
let b = 2.0
//let c = a + b -- can't mix ints and doubles
let c = a + Int(b)
let d = Double(a) + b

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

//you can still add 2 with += to a double
var name = "Nicolas Cage"
var rating = 5.0
rating += 2
rating = 5.0 + 2 // even like this, but you can't use vars


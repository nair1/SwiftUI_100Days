import Cocoa

//----------------------------------------------
//BOOLEANS

let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let goodDogs = true
let gameOver = false
let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
isAuthenticated.toggle() // this and the line above it are equivalent



//----------------------------------------------
//JOINING STRINGS

//using plus operator
let first = "Hello, "
let second = "world!"
let greeting = first + second

//using string interpolation
let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."

print ("5 x 5 is \(5 * 5)")



//----------------------------------------------
//SUMMARY

//variable types: let - constants, var - variables

//strings contain text
//strings start and end with double quotes
//multi-line strings use triple quotes

//whole numbers - int
//decimal numbers - double (not 100% accurate)
//both have operators like +, -, *, /, +=, -=, *=, /=

//booleans - true, false
//has a .toggle() method to flip

//Swift also has string interpolation by using \()



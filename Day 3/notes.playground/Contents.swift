import Cocoa

//----------------------------------------------
//ARRAYS

var beatles = ["John", "Paul", "George", "Ringo"]
let numbers = [4, 8, 15, 16, 23, 42]
var temperatures = [25.3, 28.2, 26.4]

print(beatles[0]) // arrays start at 0
//print(beatles[4]) -- runtime error, out of bounds

beatles.append("Adrian")
beatles.append("Allen")
//beatles.append(4) -- compile error, can't mix types

//declaring, appending, accessing elements
var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

var albums = [String]() // shorthand for Array<String>()
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

var albums2 = ["Rodeo"] // swift can infer this is a string array

//counts, removals
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters.count)

characters.removeAll()
print(characters.count)

//special functions
let bondMovies = ["Casino Royale", "Spectre", "No Time to Die"]
print(bondMovies.contains("Frozen"))

let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents) // ReversedCollection, not string array



//----------------------------------------------
//DICTIONARIES

//this is not ideal
var employee = ["Taylor Swift", "Singer", "Nashville"]
print("Name: \(employee[0])")
print("Job Title: \(employee[1])")
print("Location: \(employee[2])")

let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]

print(employee2["name"]) // warning, implicitly coerced
print(employee2["age", default: "Unknown"]) // no warning

let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false
]

let olympics = [
    2012: "London",
    2016: "Rio",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaq"] = 216
heights["LeHumble"] = 206

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin" // overwrites old value



//----------------------------------------------
//SETS

let actors = Set([
    "Denzel",
    "Tom",
    "Nicolas",
    "Samuel"
])

var actors2 = Set<String>()
actors2.insert("Denzel")
actors2.insert("Tom")
actors2.insert("Nicolas")
actors2.insert("Samuel")



//----------------------------------------------
//ENUMS

var selected = "Monday"
selected = "Tuesday"
selected = "January" // this is why we need enums
selected = "Friday " // the space causes an error

enum Weekday {
    case monday, tuesday, wednesday // same line
    case thursday // or multiple lines
    case friday
}

var day = Weekday.monday
day = Weekday.tuesday
day = .wednesday // shorthand notation

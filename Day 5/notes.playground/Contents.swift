import Cocoa

//----------------------------------------------
//CONDITIONS

var someCondition = true

if someCondition {
    print("Do Something!")
    print("Do something else!")
}

let score = 85

if (score > 80) { // () are optional in condition
    print("Great job!")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("We don't need roads")
}

if percentage < 85 { // this is false
    print("failed test")
}

if age >= 18 {
    print("You can vote")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName { // alphabetical check
    print("It's \(ourName) vs \(friendName)")
}

if ourName > friendName { // alphabetical check
    print("It's \(friendName) vs \(ourName)")
}

var numbers = [1, 2, 3]
numbers.append(4)

if numbers.count > 3 {
    numbers.remove(at: 0)
}

print(numbers)

let country = "Canada"

if country == "Australia" {
    print("G'day")
}

let name = "Taylor Swift"

if name != "Anonymous" {
    print("Welcome, \(name)")
}

var username = "taylorswift123"

if username == "" {
    username = "Anon"
}

print("Welcome, \(username)")

if username.isEmpty {
    
}



//----------------------------------------------
//CHECKING MULTIPLE CONDITIONS

let old = 16

if old >= 18 {
    print("You can vote")
}

if old < 18 { // not needed, use else instead
    print("nah fam")
}

if old >= 18 {
    print("You can vote")
} else {
    print("nah fam")
}

if old >= 25 {
    print("car renter")
} else if old >= 18 { // you can also use else if
    print("voter")
} else {
    print("nah fam")
}

let temp = 25

if temp > 20 {
    if temp < 30 {
        print("nice day") // don't use nested conditions
    }
}

if temp > 20 && temp < 30 { // AND
    print("nice day")
}

let userAge = 14
let hasParentalConsent = true

if age >= 18 || hasParentalConsent {
    print("you can buy the game")
}

enum TransportOption {
    case airplane, helicopter, bicycle, car, escooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("fly")
} else if transport == .bicycle {
    print("bike")
} else if transport == .car {
    print("car")
} else {
    print("scoot")
}



//----------------------------------------------
//SWITCH

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

//you could use if, else if, else to check all of these
//but there's a lot of repitition and chances for mistakes

//no need for breaks in Swift
//it will auto exit as soon as a case is reached
switch forecast {
    case .sun:
        print("sunny day")
    case .rain:
        print("umbrella")
    case .wind:
        print("windy")
    case .snow:
        print("snowy")
    case .unknown:
        print("unknown weather")
}

let place = "metropolis"

switch place {
    case "Gotham":
        print("Batman")
    case "MC1":
        print("Judge dredd")
    case "Wakanda":
        print("black panther")
    
    default:
        print("who tf are you")
}

let day = 5
print("my true love gave to me...")

switch day {
    case 5:
        print("5 golden birds")
        fallthrough // this will fall through to next case
    case 4:
        print("4 calling birds")
        fallthrough
    case 3:
        print("3 french hens")
        fallthrough
    case 2:
        print("2 turtle doves")
        fallthrough
    default:
        print("A partridge in a pear tree")
}



//----------------------------------------------
//TERNARY OPERATOR

let age3 = 18
let canVote = age >= 18 ? "Yes" : "No"

let hour = 23

print(hour < 12 ? "It's before noon" : "It's after noon")

let names = ["Jayne", "Kaylee", "Mal"]

let crewCount = names.isEmpty ? "No one" : "\(names.count) people"

enum Theme {
    case light, dark
}

let theme = Theme.dark
let background = (theme == .dark) ? "black" : "white"


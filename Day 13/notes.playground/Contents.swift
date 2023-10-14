import Cocoa

//----------------------------------------------
//HOW TO CREATE AND USE PROTOCOLS

//similar to an interface
//you can conform to multiple protocols by listing all of them comma separated
protocol Vehicle {
    var name: String { get }
    var numPassengers: Int { get set  }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}
 
struct Car: Vehicle {
    let name = "Car"
    var numPassengers = 4
    
    func estimateTime(for distance: Int) -> Int {
        return distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance) miles.")
    }
    
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bicycle"
    var numPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        return distance / 10
    }
    
    func travel(distance: Int) {
        print ("I'm cycling \(distance) miles.")
    }
}

//protocols allow us to use this function with any struct that conforms to Vehicle
func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("too far!")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance) miles")
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 100, using: bike)

getTravelEstimates(using: [car, bike], distance: 150)



//----------------------------------------------
//HOW TO USE OPAQUE RETURN TYPES

//says this will return some type of Equatable
func getRandomNumber() -> some Equatable {
    return Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    return Bool.random()
}

print(getRandomNumber() == getRandomNumber())



//----------------------------------------------
//HOW TO CREATE AND USE EXTENSIONS

var quote = "   sample quote   "
var trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)

//for change in place, use trim
//for something that returns a new string, use trimmed
extension String {
    func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    //change in place
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

quote.trim()
print(quote)

let linedQuote = """
line 1,
line 2,
line 3
"""
print(linedQuote.lines)

//if you want to create a custom initializer for a struct without losing the default
//memberwise initializer, you can put the custom initializer in an extension
//that way, you can still access the default initializer if you wanted to



//----------------------------------------------
//HOW TO USE PROTOCOL EXTENSIONS

let guests = ["Mario", "Luigi", "Peach"]

if !guests.isEmpty {
    print("we got \(guests.count) guests")
}

//!guests.isEmpty is kinda ugly

extension Collection {
    var isNotEmpty: Bool {
        return !isEmpty
    }
}

if guests.isNotEmpty { // much better
    print("we got \(guests.count) guests")
}

protocol Person {
    var name: String { get }
    func sayHello()
}

//gives a default implementation of sayHello, but allows structs to override if necessary
extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

var employee = Employee(name: "Taylor")
employee.sayHello()



//----------------------------------------------
//SUMMARY: PROTOCOLS AND EXTENSIONS

//protocols are like contracts for code - similar to interfaces
//opaque return types let us hide some information from our code, but don't have to be precise about return type
//extensions let us add functionality to existing types
//protocol extensions let us add functionality to many types all at once

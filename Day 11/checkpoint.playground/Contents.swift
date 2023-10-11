import Cocoa

//create a struct to store information about a car
//include:
//its model
//number of seats
//current gear

//add a method to change gears up or down
//have a think about variables and access control
//don't allow invalid gears, 1...10 seems like a fair range

enum GearError: Error {
    case tooHigh, tooLow
}

struct CarInfo {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int = 1
    
    mutating func shiftUp() throws {
        if currentGear + 1 > 10 {
            throw GearError.tooHigh
        }
        
        currentGear += 1
    }
    
    mutating func shiftDown() throws {
        if currentGear - 1 < 1 {
            throw GearError.tooLow
        }
        
        currentGear -= 1
    }
}

var car = CarInfo(model: "Mazda 3", numberOfSeats: 4, currentGear: 1)

do {
    try car.shiftUp()
    try car.shiftDown()
    try car.shiftDown()
} catch GearError.tooLow {
    print("gear too low!")
} catch GearError.tooHigh {
    print("gear too high!")
}



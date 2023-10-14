import Cocoa

//make a protocol that describes a building
//requires
//1. property storing how many rooms it has
//2. property storing the integer cost
//3. property storing the name of the real estate agent
//4. a method for printing the sales summary of the building

//create two structs that conform to Building, House and Office

protocol Building {
    var numRooms: Int { get }
    var cost: Int { get }
    var agent: String { get }
    
    func getSalesSummary()
}

struct House {
    let numRooms = 4
    let cost = 500_000
    let agent = "Me"
    
    func getSalesSummary() {
        print("A house with \(numRooms) rooms sold for \(cost) by \(agent)")
    }
}

struct Office {
    let numRooms = 20
    let cost = 3_000_000
    let agent = "Office agent"
    
    func getSalesSummary() {
        print("An office with \(numRooms) rooms sold for \(cost) by \(agent)")
    }
}


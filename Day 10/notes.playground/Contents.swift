import Cocoa

//----------------------------------------------
//STRUCTS

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let rodeo = Album(title: "Rodeo", artist: "Travis Scott", year: 2015)

print(red.title)
print(rodeo.artist)

red.printSummary()
rodeo.printSummary()

struct Employee {
    // you can provide default vals
    // if let, you can't initialize via initializer
    // if var, you can
    let name: String
    var vacationRemaining = 14
    
    //must use mutating keyword if changing any properties
    mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaining.")
        }
    }
}

var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)
archer.takeVacation(days: 5) // you can only call a mutating func if the object is variable, not constant
print(archer.vacationRemaining)

//terminology: structs have properties and methods
//an initialization of a struct is called an instance of a struct
//Employee(name: "", vacationRemaining: 0) is an initializer
//swift has a hidden .init func that acts as the initializer
//Employee() is shorthand for Employee.init()
//we've already used this all the time, ex. Double(a), Int(b)



//----------------------------------------------
//COMPUTE PROPERTY VALUES DYNAMICALLY

struct Employee2 {
    let name: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    //this way, we can keep track of how much we started with and how much we've taken
    var vacationRemaining: Int {
        get {
            vacationAllocated - vacationTaken
        }
        
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}

var bro = Employee2(name: "bro", vacationAllocated: 20)
bro.vacationTaken += 4
print(bro.vacationRemaining) //every time it's read, it's recalculated
bro.vacationTaken += 4
print(bro.vacationRemaining)

bro.vacationRemaining = 5
print(bro.vacationAllocated)



//----------------------------------------------
//HOW TO TAKE ACTION WHEN A PROPERTY CHANGES

//didSet runs after a property changes
//willSet runs before a property changes

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts")
            print("Old value was: \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian")
app.contacts.append("Allen")
app.contacts.append("Ish")



//----------------------------------------------
//HOW TO CREATE CUSTOM INITIALIZERS

struct Player {
    let name: String
    let number: Int
    
    //no func keyword, just init
    //no return type
    //use self to assign property values
    //by using this, you lose the default init provided by Swift
    init(name: String) {
        self.name = name
        self.number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")




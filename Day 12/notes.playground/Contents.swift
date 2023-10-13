import Cocoa

//----------------------------------------------
//CLASSES

//differ from structs in 5 key ways

//similarities
// - you get to create and name them
// - add properties, methods, observers, access control
// - custom initializers

//differences
// - you can make one class build on functionality of another class
// - swift won't generate a memberwise initializer
// - if you copy an instance of a class, both point to the same data
// - we can add a deinitializer to run when the final copy is destroyed
// - constant class instances can have their variable props changed

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10



//----------------------------------------------
//MAKE ONE CLASS INHERIT FROM ANOTHER

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

//final means the class cannot be inherited from
final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day.")
    }
}

final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Developer(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()



//----------------------------------------------
//CLASS INITIALIZERS

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)



//----------------------------------------------
//COPYING CLASSES

class User {
    var username = "Anon"
    
    func copy() -> User {
        let user = User()
        user.username = username
        
        return user
    }
}

var user1 = User()
var user2 = user1
user2.username = "Taylor"

//this happens because classes are pass by reference
print(user1.username)
print(user2.username)

var user3 = user1.copy()
user3.username = "Taylor2"
print(user1.username)
print(user3.username)



//----------------------------------------------
//DEINTIIALIZERS

//1. you don't use func with deinitializers
//2. deinitializers never take params, never return data
//3. they run when the last copy of a class instance is destroyed
//4. we never call deinitializers directly
//5. structs don't have deinitializers

class User2 {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }
    
    deinit {
        print("User \(id): I'm dead!")
    }
}

var users = [User2]()

for i in 1...3 {
    let user = User2(id: i)
    print("User \(user.id): I'm in control!")
    users.append(user)
}

print("Loop is finished")
users.removeAll()
print("array is clear!")



//----------------------------------------------
//WORKING WITH VARIABLES INSIDE CLASSES

class User3 {
    var name = "Paul"
}

let user = User3()
user.name = "Taylor" // we changed a variable inside a constant class
print(user.name)

class User4 {
    var name = "Paul"
}

var user4 = User4()
user.name = "Taylor"
user4 = User4()
print(user.name)



//----------------------------------------------
//SUMMARY: CLASSES

//classes have lots of things in common with structs
//classes can inherit from other classes, they gain access to properties and methods of parent
//swift doesn't generate a memberwise initializer for classes
//copies of a class instance point to the same instance
//classes run deinitializers when the last copy of an instance is destroyed
//you can change variable properties inside constant class instances

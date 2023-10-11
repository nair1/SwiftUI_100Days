import Cocoa

//----------------------------------------------
//ACCESS CONTROL

struct BankAccount {
    private var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds > amount {
            funds -= amount
            return true
        }
        
        return false
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

//nothing stopping us from modifying funds directly
//unless funds is private
//account.funds -= 1000 -- only works if funds isn't private

//use private to limit to the struct
//use fileprivate to limit to the file
//use public for no limits
//use private(set) to let anyone read, but only private methods write



//----------------------------------------------
//STATIC PROPERTIES AND METHODS

struct School {
    static var studentCount = 0
    
    //don't need mutating for static methods
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

//only one instance per struct
School.add(student: "Taylor Swift")
print(School.studentCount)

//if you want to mix and match static and non-static, 2 rules

//1. if you want to access non-static stuff from static method
//  you can't, it's not possible! It doesn't make any sense
//2. if you want to access static stuff from non-static method
//  you can!, you can use (uppercase) Self. or School.

//self - the current value of a struct
//Self - the current type of a struct

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

print(AppData.version) // easy to access universal, one-time info

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "jappleseed", password: "password123")
}

print(Employee.example) // easy to access example data



//----------------------------------------------
//SUMMARY - STRUCTS

//You can create your own structs using the "struct" keyword
//structs can have their own properties and methods
//if a method modifies properties of its struct, it must be marked as mutating
//structs can have stored properties and computed properties
//we can attach didSet and willSet property observers to properties
//swift generates an initializer for all structs using their property names
//you can create custom initializers to override
//we can use access control to limit what code can use properties and methods
//static properties and methods are directly attached to a struct and not to an instance of a struct

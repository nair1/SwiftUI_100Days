import Cocoa

//----------------------------------------------
//DEFAULT VALUES FOR PARAMETERS

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) * \(number) == \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)

var characters = ["a", "b", "c", "d"]
characters.removeAll(keepingCapacity: true) // keeps original capacity of 4
print(characters)


//----------------------------------------------
//HANDLE ERRORS GRACEFULLY

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    //we mark this as a throwing func to ensure all calling methods try/catch this
    if password.count < 5 { throw PasswordError.short }
    if password == "12345" { throw PasswordError.obvious }
    
    if password.count < 8 {
        return "OK"
    }
    
    if password.count < 10 {
        return "Good"
    }
    
    return "Excellent"
}

let string = "12345"

do {
    let result = try checkPassword(string) // "try" must be written before all throwing functions
    print(result)
} catch PasswordError.short {
    print("There was a short password error")
} catch PasswordError.obvious {
    print("There was a obvious password error")
} catch {
    print("There was a different type of error: \(error.localizedDescription)")
}

//you can also use try! if you're 100% confident it won't throw an exception
let result = try! checkPassword("1234567890")



//----------------------------------------------
//SUMMARY: FUNCTIONS

//functions let us reuse code again and again
//func funcName(parameters) { body }
//functions can accept parameters to control their behavior
//you can add custom external parameter names, or _ to disable the external parameter name
//function parameters can have default values for common scenarios
//functions can return a value, or multiple values with a tuple (which you can name individually)
//functions can throw errors, and be handled from the call side with do, try, catch


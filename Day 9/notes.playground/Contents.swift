import Cocoa

//----------------------------------------------
//CLOSURES

func greetUser() {
    print("Hi there!")
}

greetUser()
var greetCopy = greetUser // assign greetCopy to the function greetUser
greetCopy() // now when calling greetCopy, it's actually calling greetUser

let sayHello = { // assigning a function to a variable, called a closure
    print("Hi there!")
}

sayHello()

var greetCopy2: () -> Void = greetUser // type annotated var, no inputs and returns Void
//you can also write it as () -> (), but this is more confusing

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    }
    
    return "Anon"
}

let data: (Int) -> String = getUserData
let user = data(1989) // notice how we don't have to specify the parameter names using closures
print(user)

let sayHello2 = { (name: String) -> String in // input parameter name String, returns String
    return "Hi \(name)!"
}

sayHello2("Sachin") // we don't have to use the parameter name with closures

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
var sortedTeam = team.sorted()
print(sortedTeam)

//what if we wanted to pass a custom sorting function into sorted?
//let's say we wanted a method where Suzanne always came first because she's the captain
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    }
    
    if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}

sortedTeam = team.sorted(by: captainFirstSorted)
print(sortedTeam)

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    }
    
    if name2 == "Suzanne" {
        return false
    }
    
    return name1 < name2
}) // inline closure



//----------------------------------------------
//SHORTHAND SYNTAX

//in the case of sorted, we must pass in two inputs and return a bool
//we can use shorthand to reduce this

var sorted2 = team.sorted(by: { a, b in
    if a == "Suzanne" {
        return true
    }
    
    if b == "Suzanne" {
        return false
    }
    
    return a < b
})

//we can keep going by using trailing closure syntax (getting rid of the by: )
sorted2 = team.sorted { a, b in
    if a == "Suzanne" {
        return true
    }
    
    if b == "Suzanne" {
        return false
    }
    
    return a < b
}

//we can keep going with shorthand syntax
sorted2 = team.sorted {
    if $0 == "Suzanne" {
        return true
    }
    
    if $1 == "Suzanne" {
        return false
    }
    
    return $0 < $1
}

//this is a bit ugly, but if the code was simpler, we could use these

let reverseTeam = team.sorted { $0 > $1 } // return keyword is optional for single line
print(reverseTeam)

//use shorthand syntax, unless
//1. the closure is long
//2. you re-use the parameters multiple times
//3. you have a lot of inputs (3 or more)

let tOnly = team.filter {$0.hasPrefix("T")}
print(tOnly) // only gets the team names that start with "T"

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)



//----------------------------------------------
//ACCEPTING FUNCTIONS AS PARAMETERS

func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let rolls = makeArray(size: 50) { // this only works if the func is the last parameter
    Int.random(in: 1...20)
}

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: { // must specify all func names after the first parameter
    print("This is the second work")
} third: {
    print("This is the third work")
}



//----------------------------------------------
//SUMMARY

//you can copy functions in swift, they work exactly the same (without the parameter labels)
//you can create closures by directly assigning to a constant or variable
//closure parameters and return values are declared inside their braces

//functions can accept other functions as parameters
//anywhere you can pass a function, you can also pass a closure
//when passing a closure as a function parameter, you don't need to write out the types
//inside your closure if Swift can figure it out

//If a function's final parameters are functions, use trailing closure syntax
//You can use short hand parameter names like $0 and $1
//you can make your own functions that accept functions as parameters



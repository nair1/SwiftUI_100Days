import Cocoa

//----------------------------------------------
//FUNCTIONS

func showWelcome() {
    print("Welcome to my app!")
    print("By default, this prints out a conversion.")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome()

let number = 139

if number.isMultiple(of: 2) { // isMultiple() is a function
    print("even")
}

func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) * \(number) = \(i * number)")
    }
}

printTimesTables(number: 5) // must include number:



//----------------------------------------------
//RETURN VALUES FROM FUNCTIONS

let root = sqrt(169)
print(root)

func rollDice() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

//create a function that checks if two strings contain the same letters, regardless of their order

func checkStrings(str1: String, str2: String) -> Bool {
    return str1.sorted() == str2.sorted() // with single line functions, you don't need the return keyword
}

print(checkStrings(str1: "abc", str2: "cab"))

func calcHypotenuse(side1: Double, side2: Double) -> Double {
    return sqrt(pow(side1, 2) + pow(side2, 2))
}

print(calcHypotenuse(side1: 5, side2: 12))



//----------------------------------------------
//RETURN MULTIPLE VALUES FROM FUNCTIONS

func getUser() -> [String] {
    return ["Taylor", "Swift"]
}

let user = getUser()
print("Name: \(user[0]) \(user[1])") // not good, need to remember what indices mean

func getUser2() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user2 = getUser2()
print("Name: \(user2.firstName) \(user2.lastName)")

func getUser3() -> (String, String) {
    return ("Taylor", "Swift")
}

let user3 = getUser3()
print("Name: \(user3.0) \(user3.1)")

let (firstName, _) = getUser3()
print(firstName)



//----------------------------------------------
//CUSTOMIZE PARAMETER LABELS

let lyric = "I see a red door and I want it painted black."
print(lyric.hasPrefix("I see")) // don't need to specify parameter name, why?

func isUppercase(_ str: String) -> Bool { // adding a _ before the parameter name means you don't have to specify parameter name when calling it
    return str == str.uppercased()
}

let string = "HELLO, WORLD"
let isStringUppercased = isUppercase(string)

func printTimesTable2(for number: Int) {
    for i in 1...12 {
        print("\(i) * \(number) = \(i * number)")
    }
}

printTimesTable2(for: 5) // use an alternate parameter name to use externally

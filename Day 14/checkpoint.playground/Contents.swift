import Cocoa

//write a function that accepts an optional array of ints
//randomly returns one of them
//if the array is empty or missing, return a new number between 1...100
//write the function in a single line of code

func returnNum(numbers: [Int]?) -> Int { return numbers?.randomElement() ?? Int.random(in: 1...100) }

var numbers: [Int]? = [1, 2, 3]
print(returnNum(numbers: numbers))

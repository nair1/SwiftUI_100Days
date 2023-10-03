import Cocoa

//create an array of strings
//then write some code that prints the number of items in the array
//and also print the number of unique number of items in the array

var strings = ["A", "B", "C", "A", "B", "D", "E", "F"]

print("Total elements: \(strings.count)")
print("Unique elements: \(Set(strings).count)")

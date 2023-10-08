import Cocoa

//input is this
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

//filter out any numbers that are even
//sort the array in ascending order
//map them to strings in the format "# is a lucky number"
//print the resulting array, one item per line
//try doing it without creating any temporary variables

let final = luckyNumbers
    .filter { !$0.isMultiple(of: 2) }
    .sorted()
    .map {"\($0) is a lucky number"}

print(final)

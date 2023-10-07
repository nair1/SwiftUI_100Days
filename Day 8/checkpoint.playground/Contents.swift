 import Cocoa

//write a function that accepts an integer parameter from 1 to 10000
//returns the integer square root of that input
//you can't use the built in sqrt method
//throw an out of bounds error if the number is out of bounds
//only consider integer square roots
//if you can't find the square root, throw a no root error

enum SqrtError: Error {
    case lowerBound, upperBound, noRoot
}

func calcSqrt(_ num: Int) throws -> Int {
    if num < 1 {
        throw SqrtError.lowerBound
    }
    
    if num > 10000 {
        throw SqrtError.upperBound
    }
    
    for i in 1...100 {
        let squared = i * i
        
        if squared == num {
            return i
        }
        
        if squared > num {
            throw SqrtError.noRoot
        }
    }
    
    throw SqrtError.noRoot
}

do {
    let result = try calcSqrt(1601)
} catch {
    print("Error: \(error.localizedDescription)")
}

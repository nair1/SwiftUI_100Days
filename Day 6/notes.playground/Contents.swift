import Cocoa

//----------------------------------------------
//FOR LOOPS

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}

for i in 1...12 {
    print(i)
}

for i in 1...12 {
    for j in 1...12 {
        print("\(i) * \(j) = \(i * j)")
    }
}

for i in 1...5 {
    print("1 through 5: \(i)")
}

for i in 1..<5 { // ..< excludes the upper range
    print("1 up to 5: \(i)")
}

var lyric = "Haters gonna"

for _ in 1...5 { // you can ignore the loop var as well
    lyric += "hate"
}



//----------------------------------------------
//WHILE LOOPS

var countdown = 10

while countdown > 0 {
    print("\(countdown)")
    countdown -= 1
}

print("Blast off!")

let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}



//----------------------------------------------
//BREAK and CONTINUE

let filenames = ["me.jpg", "work.txt", "sophie.jpg"]

for filename in filenames {
    if !filename.hasSuffix(".jpg") {
        continue
    }
    
    print("Found picture: \(filename)")
}

let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)



//----------------------------------------------
//Summary

//use if, else, and else if to check conditions
//you can combine conditions using || and &&
//switch statements can be easier than using if, else if, else
//switch statements must be exhaustive

//the ternary conditional operator lets us check what? : true, false

//for loops let us loop over arrays, sets, dicts, etc
//while loops create loops that continue until a condition is false

//we can skip look items using continue or break

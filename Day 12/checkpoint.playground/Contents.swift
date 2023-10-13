import Cocoa

//make a class hierarchy for animals
//start with animal, add a legs property for the number of legs an  animal has
//make dog a subclass of Animal, giving it a speak() method that prints a dog barking string, but each subclass should print something different
//make corgi and poodle subclasses of dog
//make cat an animal subclass, add a speak() method, with each subclass printing something different, and an isTame boolean, set with an initializer
//make persian and lion as subclasses of cat

class Animal {
    let numLegs: Int
    
    init(numLegs: Int) {
        self.numLegs = numLegs
    }
}

class Dog: Animal {
    func speak() {
        print("bark")
    }
}

final class Corgi: Dog {
    override func speak() {
        print("corgi bark")
    }
}

final class Poodle: Dog {
    override func speak() {
        print("poodle bark")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(numLegs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(numLegs: numLegs)
    }
    
    func speak() {
        print("meow")
    }
}

final class Persian: Cat {
    override func speak() {
        print("persian meow")
    }
}

final class Lion: Cat {
    override func speak() {
        print("lion meow")
    }
}

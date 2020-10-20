import UIKit

// Automatic Reference Counting & Retain Cycles

class classA {
    var property1: String?
    var property2: classB?
    
    init(property1: String, property2: classB?) {
        self.property1 = property1
        self.property2 = property2
        
    }
    
    // this method will execute everytime the instance is deallocated from the memory
    deinit {
        print("classA references are deinitialised")
    }
}

class classB {
    
    // Without " weak " or "unowned" keyword the retain count cannot be 0, when the assigned object is nil
    /*
     `Difereces`: weak vs unowned
     == weak ==
     1. weak declared as opltional. It may contain actual type or nil.
     2. the value of weak reference needs to be unlocked before it can be used.
     
     * When to use: when you are not sure the instance will exist for the lifetime.
     
     == unowned ==
     1. unowned always has an actual type.
     2. you can directly acess the value of an unowned reference.
     3. an unowned reference is deallocated, It isn't set to nil. when access after deallocation a fatal error is thrown.
     */
     
    weak var propertyX: classA?
    var propertyY: String?
    
    init(propertyX: classA?, propertyY: String) {
        self.propertyX = propertyX
        self.propertyY = propertyY
    }
    // this method will execute everytime the instance is deallocated from the memory
    deinit {
        print("classB references are deinitialised")
    }
}

func performOperations()
{
    var propertyI : classA?
    var propertyJ : classB?
    
    propertyI = classA(property1: "property1", property2: nil)
    propertyJ = classB(propertyX: nil, propertyY: "propertyY")
    
    propertyI?.property2 = propertyJ
    propertyJ?.propertyX = propertyI
    
    propertyI = nil
    
    print(propertyJ?.propertyX  ?? nil)
}


performOperations()

/*
 == Memory Management is Swift ==
 1. ARC deos not increase or descrease reference count of value types because, when assigned, they are copied.
 2. The quick and dirty explanation is that reference types share a single copy of their data while value types keep a unique copy of their data.
 3. By default, all the references are strong references.
  
 */

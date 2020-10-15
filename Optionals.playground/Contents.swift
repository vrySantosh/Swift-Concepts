
// Optionals // Eg: Shoe Box

var val:Int? //
var val2:Int!

print(val)
print(val2)

var someValue:Int? = 5
print(someValue)

// Force Un-Wrapping
print(someValue!)

// Explicit declaration of unwrapped optional
let explicitOptional:Int! = 50
print(explicitOptional)


// Fatal Error when accessing null unwrapped optional
//var unwrappedOptional :Int = someValue
var unwrappedOptional:Int = explicitOptional
print(unwrappedOptional)

// Optional Unwrappig
// If-Let

if let temp = someValue{
    print("It has some value!")
}
else {
    print("doesn't contain value")
}

// Gaurd statement
func testGaurd()
{
    var somevalu:Int? = 90
    guard let temp = somevalu else {
        print("temp does not have a value the function is going to return to the calling function")
        return
    }
    print("It has some value. So, the function continuing")
//    if let temp = somevalu {
//        print("It has some value. So, the function continuing")
//        print(temp)
//    }
//    else
//    {
//        print("temp does not have a value the function is going to return to the calling function")
//        return
//    }
    
}
testGaurd()

// Nil-Coalescing Operator

let unwrappedVal: Int = val ?? 100
print(unwrappedVal)




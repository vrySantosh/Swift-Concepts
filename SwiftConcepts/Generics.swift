/* Generics

    In Swift, generics are a way to write flexible and reusable functions and types. 
    This means you can write code that can work with any type, 
    rather than having to write specific versions of the same code for each type you want to use.
*/

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

/*  In this code, the <T> after the function name indicates that this is a generic function 
    that can work with any type T. The a and b parameters are marked as inout so that 
    they can be modified within the function, and they are of type T. 
    This means that the type of a and b will be determined when the function is called, 
    based on the types of the values passed to the function.
*/

// Here's an example of how you might call this function:

var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)
// someInt is now 107, and anotherInt is now 3

var someString = "hello"
var anotherString = "world"
swapTwoValues(&someString, &anotherString)
// someString is now "world", and anotherString is now "hello"

/*  In this example, the swapTwoValues function is called twice. The first time, 
    it is called with two Int values, so the T type is inferred to be Int. 
    The second time, it is called with two String values, so the T type is inferred to be String. 
    In both cases, the function swaps the values of the two variables as expected.

    Generics can be used to write functions and types that are more flexible and reusable 
    than non-generic versions of the same code. By using generics, you can write code that 
    can work with any type, rather than having to write separate versions of the same code for each type
    you want to use.
*/

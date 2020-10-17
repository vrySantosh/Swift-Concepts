import UIKit

// External closure declaration
// Closure with arguments
let sampleClosure :(String) -> (String) = { value in
    print(value)
    return "sample closure return value"
}

// Caliing closure externally
let closureReturn = sampleClosure("damn this is how you call external closure")
print(closureReturn)

// Closure as an argument of a function
func someFunction(msg str:String, someClosure: (String) -> (String)) -> Void
{
    let getReturnValue = someClosure("adada")
    print(getReturnValue)
    print ("function executing")
}

// Calling a function with closure in it
someFunction(msg: "sample msg", someClosure: {
    value in
    for i in 1...10
    {
        print(i, value, separator: "->", terminator: "\n")
    }
    
    return "someClosure return value"
})

// Tailing closure
someFunction(msg:"sample msg"){ value in
    print("Tailing closure", value)
    
    return "tailing closure return"
}

// Auto Closure

// Closure as an argument of a function
func autoReleaseExample(msg str:String, someAutoClosure:@autoclosure () -> ()) -> Void
{
    print(someAutoClosure())
  
    print ("function executing")
    
}

autoReleaseExample(msg: "blah blah", someAutoClosure: (
print("Auto Release is Working")
))

// Auto closure with arguments and return values

// Closure as an argument of a function
// "_" Specify the no argument required when calling the method/function
func autoReleaseExample2(_ someAutoClosure:@autoclosure() -> (String)) -> Void
{
    print(someAutoClosure())
    print ("function executing")
}

autoReleaseExample2("auto release closure wiithout empty argument name")

// Escaping and Non-Escaping Closures

var closureArr:[() -> ()] = []
func escapingClosureExample(escapingClosure:@escaping () -> ()) -> String {
    
    // Escaping closure will be executed after the the retrn statement
    DispatchQueue.main.async {
        closureArr.append(escapingClosure)
        print(closureArr)
        print("this dispatch queue is executing")
    }
    
    print("about to execute the return statement")
    return "returning the function"
}

escapingClosureExample {
    print("excute escaping closure")
}

// Closure as a completion block
// Note: 1. Use @escaping when you want use closure after the function execution
// Note: 2. Use @escaping when you want the completion is to be exxecuted in the asynchronous way. (which means executing a peice of code after the function return or function done with its course)
func completionClosure(completion: @escaping ()->()) -> String
{
    //perform operation before calling call back
    print("function callled")
    print("doing some work before calling callback")
    completion()
    closureArr.append(completion)
    print("do something after callback")
    //this will be called after completing callback
    
    return "returning the completion function"
}

var comClosure = completionClosure {
    print("this completion call back is called")
}
print(comClosure)

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
// Note: 2. Use @escaping when you want the completion is to be exxecuted in the asynchronous way. 
// (which means executing a peice of code after the function return or function done with its course)

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

// In Swift, a closure is a block of code that can be passed as a value to a function. 
// Closures can capture values from the surrounding context in which they are defined, 
// which allows them to be used in a flexible and powerful way.

//Here is an example of a simple closure in Swift:

let greet = {
    print("Hello, world!")
}
//This closure doesn't take any arguments and doesn't return a value. It simply prints a greeting to the console when it is called.

// To call the closure, you can use the following syntax:


greet() // prints "Hello, world!"
// You can also pass arguments to a closure, and you can specify a return type for the closure if it needs to return a value. For example:

 
let addTwoNumbers = { (a: Int, b: Int) -> Int in
    return a + b
}

let result = addTwoNumbers(4, 6) // result is 10
// In this example, the closure addTwoNumbers takes two arguments of type Int and returns a value of type Int. 
// When the closure is called, it adds the two arguments together and returns the result.

// One of the most powerful features of closures is that they can capture values from the surrounding context. For example:

 
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen() // returns 10
incrementByTen() // returns 20
incrementByTen() // returns 30

let incrementByFive = makeIncrementer(forIncrement: 5)
incrementByFive() // returns 5
incrementByFive() // returns 10
incrementByFive() // returns 15

// In this example, the makeIncrementer function takes a single argument amount and returns a closure that increments 
// a running total by that amount each time it is called. The closure captures the runningTotal and amount values from the surrounding context, 
// allowing it to maintain its own state and modify the values as needed.


// In Swift, a closure is called an "escaping closure" if it is passed as an argument to a function and is called after the function returns.
// An "non-escaping closure" is a closure that is executed within the function body before the function returns.

// Here is an example of an escaping closure in Swift:


func performAsyncTask(completion: @escaping () -> Void) {
    DispatchQueue.main.async {
        // Perform some asynchronous task
        completion()
    }
}

performAsyncTask {
    print("Async task complete!")
}
// In this example, the performAsyncTask function takes a closure as an argument and performs an asynchronous task on a background thread. 
// When the task is complete, it calls the completion closure to notify the caller that the task is finished. 
// Because the completion closure is called after the performAsyncTask function returns, it is marked as an escaping closure using the @escaping attribute.

// Here is an example of a non-escaping closure in Swift:

func performSyncTask(task: () -> Void) {
    // Perform some synchronous task
    task()
}

performSyncTask {
    print("Sync task complete!")
}
// In this example, the performSyncTask function takes a closure as an argument and performs a synchronous task. 
// The closure is executed within the function body before the function returns, so it is not marked as an escaping closure.

// The distinction between escaping and non-escaping closures is important because it affects 
// the lifetime of the closure and the variables it captures. In general, non-escaping closures are more efficient 
// because they do not need to be stored and retained after the function returns. 
// However, escaping closures are often more flexible because they can be called at a later time, 
// allowing them to be used in asynchronous or event-driven situations.




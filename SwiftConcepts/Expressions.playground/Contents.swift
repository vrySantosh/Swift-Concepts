import UIKit

var str = "Hello, playground"

// Swift Expressions
let someValue:Int = 12


// Swift Statements
// Compilre contoller statements
// 1. Conditional compilation block
#if swift(<4.0)
print("we are more than you think")
#else
print("low version baby!")
#endif

// 2. Line Controll Statements
// for the sutomation tools purpose

// Controll Flow Statemens
// 1. Loop statemst
//for in while repeat while

// 2. Branch Statemnt
//if else, gaurd, switch

// 3. Constroll Transfer statemenrs
//continue fallthrough throw return break



// Swift Code Blocks

//{
//   statement
//}

if true{
    // start of block
    let sum = 2+3
    print("Result is \(sum)")
    // end of block
}

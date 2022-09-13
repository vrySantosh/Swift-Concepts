import UIKit

struct factorialStruct
{
    public private(set) var facto = Int()
    
    // Mutatating Property
    // Mutating Parameter
    // Reverse Interation
    // Recursive
    
    // Looping
    mutating func factorial(_ num:inout Int) -> Int
    {
        for i in stride(from: num - 1, to: 1 , by: -1 ) {
            num *= i
        }
        facto = num
        return facto
    }
    
    // Recursive
    func factorial2(_ num: Int) -> Int {
        if num == 1 {
            return num
        }
        return num * factorial2(num-1)
    }
    
}

var fact = factorialStruct()
var value = 5
fact.factorial(&value)
fact.factorial2(5)

import UIKit

// Fallthrough

var correctCase = 4
switch correctCase {
case 4:
    print("case 4 execution")
    fallthrough
case 5:
    print("fallthrough executing")
    
default:
    print("deafault statement")
}

// Complex patterns
var comlexVariable = (name:"swift", version: 4)
switch comlexVariable {
    case (let name, let version) where (name.count > 0 && version < 0):
        print("invalid input")
    case ("swift", let version) where version > 4 :
        print("swift version greater than 4")
case ("swift", 4...):
        print("swift version less than 4")
case ("Not Swift lang", 30):
    print("OMG! someother language")
case(let name, let version):
    print("""
            the language: \(name)
            and its version :\(version)
""")
    default:
        print("something went wrong")
}

// Filter Elements using where clause
for value in "I love swift !" where value != "!"
{
    print(value)
}

// For -In accessing index of an array
let array = [1,2,3,4,5,6]
for (index, num) in array.enumerated() {
    print("index:\(index) and value:\(num)")
}

// Use While where the number of iterations are unknown

var expressionEle = 1
while expressionEle < 10 {
    print("expressionEle: \(expressionEle) while expresion is not true yet obeyed.")
    expressionEle += 1
}
print("expressionEle: \(expressionEle)")
print("we are out of the while loop")

// Repeat While
expressionEle = 1
repeat {
    print("expressionEle: \(expressionEle) repeat while expresion is not true yet obeyed.")
    expressionEle += 1
} while expressionEle < 10
print("expressionEle: \(expressionEle)")
print("we are out of the repeat while loop")

func guardEmaple ()
{

    let name: String? = "12313"
    
    // Guard statement only execute when the expressoin is false
    guard let temp = name, temp.count < 3 else {
        print("Name is empty..")
        return
    }
    print("anme string size:\(temp.count)")
}
guardEmaple()


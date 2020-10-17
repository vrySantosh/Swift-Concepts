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


// For -In accessing index of an array
let array = [1,2,3,4,5,6]
for (index, num) in array.enumerated() {
    print("index:\(index) and value:\(num)")
}

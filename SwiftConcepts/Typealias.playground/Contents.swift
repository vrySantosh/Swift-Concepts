import UIKit

// User defined type
class Student
{
    
}

// Typealias for user defined type
typealias Students = Array<Student>
let newStudents:Students = []
print(newStudents)

// Typealias for built-in types
typealias NameType = String
var studenName:NameType = "Santosh"

// Typealias for complex types
typealias CompletionHandler = (Int)->(String)
func typealiasClosure(onComp: CompletionHandler) -> Void
{
    onComp(3)
}
typealiasClosure(onComp:{ val in
    print(val)
    return "returning some value to caller"
})






/*
 Note:
    1. Swift is type inference language, variables or constants can automatically infer the type from the value stored. So, you can skip the type while creating variable or constant. However you may consider writing the type for readability purpose but it's not recomended.
    2. Swift is type safe langauge you canot change its type with another type.
 */

// Recomended
var name = "Santosh"

// Not recomended
var anotherName:String = "Santosh"

MemoryLayout<Bool>.size
MemoryLayout<Int>.size
MemoryLayout<UInt>.size
MemoryLayout<Float>.size
var floatNum:Float = 10013.21424313131
print(floatNum)

MemoryLayout<Double>.size
var doubleNum:Double  = 10013.214243131311
print(doubleNum)

MemoryLayout<Character>.size

MemoryLayout<String>.size

// Uni-Code Char
var uniCodeEmoji = "\u{232}"
print(uniCodeEmoji)


// Strings
var stringVariable = String("khasdad")
for i in stringVariable
{
    print(i)
}

// String Escape Sequences
stringVariable = "Hello\\\0\r\tworld\'!\'\u{2424}"
print(stringVariable)

/* Data types

    Int: This data type represents whole numbers, such as -10, 0, 5, and 100. For example, 
    the variable "age" could be of type Int with a value of 25.

    Double: This data type represents decimal numbers with a higher precision than a Float. 
    For example, the variable "temperature" could be of type Double with a value of 72.5.

    Float: This data type represents decimal numbers with a lower precision than a Double. 
    For example, the variable "weight" could be of type Float with a value of 150.3.

    Bool: This data type represents a Boolean value of either true or false. 
    For example, the variable "isRainy" could be of type Bool with a value of true.

    String: This data type represents a sequence of characters, such as "Hello" or "Goodbye". 
    For example, the variable "name" could be of type String with a value of "John".

    Array: This data type represents a collection of values of the same type, such as [1, 2, 3, 4]. 
    For example, the variable "numbers" could be of type Array with a value of [1, 2, 3, 4].

    Dictionary: This data type represents a collection of key-value pairs, such as ["key1": "value1", "key2": "value2"]. 
    For example, the variable "userInfo" could be of type Dictionary with a value of ["name": "John", "age": 25].

    Optional: This data type represents a value that may or may not be present. 
    For example, the variable "age" could be of type Optional Int with a value of 25 or nil.

*/

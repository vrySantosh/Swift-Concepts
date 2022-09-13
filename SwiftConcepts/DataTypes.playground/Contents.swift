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

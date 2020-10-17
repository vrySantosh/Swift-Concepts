import UIKit

// Swift Characters

var someCharacter: Character = "h"

// Swift Strings

let someString: String = "Hello, World!"

// OPerations
// Join Strings
var result = "first string" + "second string"
result.append("!")

result += "one more string"

// String Interpolation
let congratsMessage = "Congo" + result + "for the win"
print(congratsMessage)

let anotherCongratsWayofInterpolation = "con \(result) dsfsf"
print(anotherCongratsWayofInterpolation)

// Some String Built-in functions
print(result.isEmpty)
print(result.capitalized)
print(result.lowercased())
print(result.uppercased())
print(result.count)

print(result.hasPrefix("first"))
print(result.hasSuffix("string"))

// Printing multiple lines

print("Hello \r world")
print("""
dajdsjsfj
sfsfsd
sfsfsfs
sfsfsfs
""")

print("Please Enter your favorite programming language", terminator: ".")
let name = readLine()
print("Your favorite programming language is \(name ?? "empty").")


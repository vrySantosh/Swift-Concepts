import UIKit

// Assignment operators
var left = 10
var right = 20
left <<= right
print(left)

// Bitwise NOT
var invertedNum : UInt8 = 1
invertedNum = ~invertedNum
// 00000001 <- 11111110
print(invertedNum)

// Bitwise NOT in bits
invertedNum = 0b11111111
invertedNum = ~invertedNum
print(invertedNum)

// Bitwise NOT for Signed
var bitwiseSigned:Int = -2
bitwiseSigned = ~bitwiseSigned
print(bitwiseSigned)


// Bitwise AND
var xBits = 0b1101010
var yBits = 0b1000110
var result = xBits & yBits
// result gets 1 for both xBits and yBits has 1 otherwise 0
print("Binary:", String(result, radix: 2))

// Bitwise OR
result = xBits | yBits
// result get 1 for either of xBits and yBits has 1 otherwise 0
print("Binary:", String(result, radix: 2))

// Printing Binary Representation using string radix
var num = 256
print(String(num, radix: 2))

// Bitwise XOR
result = 0b11111110 ^ 0b00000001
// result get 1 if one of the input is 1
print("Binary:", String(result, radix: 2))

// Bitwise Leftshift Operator
result = 0b11111110 << 2
// Binary getshifted 2 digits left
print("Binary:", String(result, radix: 2))

// Bitwise Rightshift Operator
result = 0b10111101 >> 2
// Binary getshifted 2 digits left
print("Binary:", String(result, radix: 2))

// Arthemetic Oprators

print(10+20)
print(20-10)
print(2*5)
print(5/2)
print(25%2)
print("Baby! "+"Stay Foolish, Stay Hungruy" + " - Steve Jobs")

// Operator Preceedence

// Bitwise Shift


// Mulltiplication
var x = 4 + 5 * 5
print(x)
// complex assignment
x = 15
x += 10 - 2 * 3
print(x)



// Operator Precedence

// Expressions
// ()[]. expr++ expr--

// Unary Operator
// * & + - ! ~ ++expr --expr

// Binary Operator
// & ^ | && ||
x = x ^ 2
print(x)

// Ternary Operator
// ?:

// Assignment Operator
// = += -= *= /= %= >>= <<= &= ^= |=

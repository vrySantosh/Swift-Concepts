import UIKit

// Functions with multiple params and multiple return vlaues
func mulFunc(firstName:String, num: Int ) -> (String, Int)
{
    return (firstName, num)
}
print (mulFunc(firstName:"Santosh", num: 16))

// Functions with multiple params and multiple return vlaues with name

func mulReturnFuncWithName(firstName:String, num: Int ) -> (name :String, num:Int)
{
    return (firstName, num)
}
print (mulReturnFuncWithName(firstName:"Santosh", num: 16))

// 1. Functions with argument labels
// 2. Function without orgument lables
// 3. Function with ommiting pearmeter lables

// 4. Functions with default param values
func sum(of a:Int = 23, and b:Int = 2423) -> Int
{
    return a + b
}

print(sum())
// 5. Functin with variadic perameters
func sum2(of Numbers:Int...) -> [Int]
{
    return Numbers
}

print(sum2(of: 1,2,3,4,5,5))

func inOutEaxmpl(num: inout Int) -> Int
{
    num = 132
    return num
}
// May get error: cannot pass immutable value as inout argument: 'val' is a 'let' constant
var val = 80
print(inOutEaxmpl(num: &val))



// Swift Ranges

// 1. Closed range
for value23 in 1...3
{
    print(value23)
}

// 2. Half Open Range
for value23 in 1..<3
{
    print(value23)
}

// 3. One sided range
let range = ..<3
print(range.contains(-1))
print(range.contains(-2))

// Functions Overloading based on param  types

struct Knife {
}
struct Gun {
}
struct Blade {
}

// By default if there is no label or '_' compiler consider  first param name the label instead of pram name
func attackUsingKnife(_ weapon:Knife) {
    //..
    print("Attacking with Knife")
}

func attackUsingBlade(weapon:Blade) {
    //..
    print("Attacking with Blade")
}

func attackUsingGun(weapon:Gun) {
    //..
    print("Attacking with Gun")
}

// Overloading functions
func attack(with weapon:Knife) {
    print("Attacking with Knife")
}

func attack(with weapon:Gun) {
    print("Attacking with Gun")
}

func attack(with weapon:Blade) {
    print("Attacking with Blade")
}
// Non Overloaded
attackUsingKnife(Knife())
attackUsingGun(weapon:Gun())
attackUsingBlade(weapon: Blade())

// Calling Functions by Overloading
attack(with: Gun())
attack(with: Blade())
attack(with: Knife())

// 2. Functions overloading based of diferennt number of perams

func output() {
    print("Good Morning!")
}

func output(text:String) {
    print(text)
}
// 2 params
func output(text:String, num:Int) {
    print("\(text)\(num)!")
}

output()
output(text: "Good Evening!")
output(text: "Good N", num: 8)

// 3. Functions obverloading with same label name

func output(value text:String) {
    print(text)
}

func output(value num:Int) {
    print(num)
}

output(value: 2)
output(value: "Hello")


// Refer : Programiz.com


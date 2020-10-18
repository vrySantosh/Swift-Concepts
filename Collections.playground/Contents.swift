import UIKit

// Arrays
var rayya:[Int] = []
print(rayya)

var neaEar:Array<String> = []
print(neaEar)

var news:Array<Int> = Array()


//Note:
/*
 NSArray is objective C elememt it is referece type, whereas Array is Swift type it bridges  to Attay<AnyObject>.
 */

var arra = Array(repeating: "bls", count: 4) + Array(repeating: "mlala", count: 3)

print(arra)
print(arra[4])

arra = Array(repeating: "er6wr", count: 8)


print(arra)
arra[4] = "shfsjfs"
print(arra.first ?? 0)
neaEar = ["fsfsfs","fsfsfsf","SFsf"]
neaEar.append(contentsOf:arra)

print(neaEar)


// Sets

/*
 Swift is type inference language so you
 */
var someset:Set<String> = []
print(someset)

var nesome:Set<String> = Set()
print(nesome)

var somevaluse: Set = [32,3,323,4,434,34]
print(somevaluse)

var dups:Set = [1,2,4,1]
print(dups)

// Acesing elements in Sets

var someStrSet:Set = ["aas","dada","das","dad"]

for val in someStrSet {
    print(val)
}
let someVal  = someStrSet.remove("aas")
print(someVal)
// if you want to handle the element in swift
print(someStrSet)

// Set Operation
// 1. union
// 2. Intersection
// 3. Subtraction
let a: Set = [1,2,3,4,5]
let b: Set = [2,5,7,8,9]
print(a.subtracting(b))

// 4. Symetric Difference
print(a.symmetricDifference(b))

// 5. Set Equility
if a == b {
    print(" a n b are same ")
}
else{
    print("a n b are not same ")
}
// 6. Set Membership

/*
 1. subset
 2. superset
 3. stricSubSet / StrictSuperSet
 4. disjoint : when two sets have no value in common
 */

// 3. Dictionary
var emptyDictionsry:[Int:String] = [:]
print(emptyDictionsry)

var emeers:[Int:String] = Dictionary()
print(emeers)

var newCombineDict  = Dictionary(uniqueKeysWithValues: zip(a, b))
print(newCombineDict)
newCombineDict[1] = 89
print(newCombineDict[1] ?? 0)

// Note: Default value for non-existent key
print(newCombineDict[15, default:0])


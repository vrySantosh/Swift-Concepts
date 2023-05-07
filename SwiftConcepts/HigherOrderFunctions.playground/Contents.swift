import UIKit

/*Higher order Functions*/

//MARK:- MAP

//Map is used when you want to apply the same operation to each element of a collection
let  names = ["vijay", "bhaskar"]
let namesCaps = names.map { $0.capitalized }
print(namesCaps)

let usdDoller = [1,20,30,66]
let indRupee = usdDoller.map {$0 * 82}
print(indRupee)

class Address {
    var street: String
    var zipcode: Int

    init(street: String, zipcode: Int) {
        self.street = street
        self.zipcode = zipcode
    }
}

var addresses = [Address]()
addresses.append(Address(street: "Nice Boulevard", zipcode: 1200))
addresses.append(Address(street: "Green Street", zipcode: 4560))

let zipcodes = addresses.map { $0.zipcode }
print("Zip codes: \(zipcodes)")
//MARK:- Filter

//Filter is used when you want to have a result with only elements that match a condition.

let filteredNames = names.filter{$0.prefix(1) == "b"}
print(filteredNames)

let newAddrCode = addresses.filter{$0.zipcode == 1200}
print(newAddrCode.count)

//MARK:- Reduce
//Reduce is used when you want to combine all elements in a collection into one value.

let numbers = [5, 3, 2, 6, 10, 23, 01, 43, 5, 7, 8, 9]
let sumOfNumbers = numbers.reduce(0, {$0 + $1})
print("Sum = \(sumOfNumbers)")

let sumOfNumbers2 = numbers.reduce(0, +)
print("Sum = \(sumOfNumbers2)")


//MARK:- Sorted
//Sorted it will return a new array that has the items sorted in ascending order
//For this method to work, the elements in the array need to conform to the Comparable protocol.

let sortedNumbers = numbers.sorted()// by default it is accending order
print(sortedNumbers)
let decendingSortedNums = numbers.sorted{($0 > $1)} // decending
print(decendingSortedNums)

let sortedNums = numbers.sorted(by: <)
print(sortedNums)

//MARK:- FlatMap
//flattens all subcollections into one single collection.

let names1 = [["roxana", "peter", "jacob", "morten"],["iben", "nour", "nicolai"]]
let flatNames = names1.flatMap({$0})
print(flatNames)
let flatNames1 = flatNames.flatMap({$0})
print(flatNames1)

//MARK:- CompactMap
//CompactMap can be used to either give you nil-values (which flapMap can’t), but also to filter out nil-values from a sequence.

let scores = ["1", "2", "three", "four", "5"]
//optional
let cmptScores:[Int?] = scores.compactMap{ str in Int(str) }

print(cmptScores)
//without optional
let cmptNumbs:[Int] = scores.compactMap{ str in Int(str)}
print(cmptNumbs)


//Chaining - using mutiple functions together
//getting street name with specific zip code
let streetName = addresses.filter{$0.zipcode == 1200}.map{$0.street}
print(streetName)

// An array of sorted capitalized  names
let namesArray = names.map{$0.capitalized}.sorted()
print(namesArray)

//Names flat map sorted descending
let decendingNames = names1.flatMap({$0.sorted(by: >)})
print(decendingNames)

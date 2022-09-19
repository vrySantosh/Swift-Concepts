//import UIKit
///**
// Given an unsorted integer array nums, return the smallest missing positive integer.
//
// Example 1:
// Input: nums = [1,2,0]
// Output: 3
//
//
// Example 2:
// Input: nums = [3,4,-1,1]
// Output: 2
//
//
// Example 3:
// Input: nums = [7,8,9,11,12]
// Output: 1
//
// */
//
//// YOUR SOLUTION HERE
//
//class Solution {
//
//    func missingSmallestInteger(givenArray arr:[Int]) -> Int {
//        var result: Int = 1
//
//        //[1,2,3,4.....]
//
//        var resultArray: [Int] = []
//
//
//        resultArray = arr.sorted()
//
//
//        for i in resultArray {
//
//            let number = resultArray[i]
//
//            // get lowest +ve Int
//            if number >= 1 {
//                if !(resultArray.contains(number)) {
//                    result = number
//                }
//            }
//
//            //
//        }
//
//        return result
//    }
//}
//
//print(Solution().missingSmallestInteger(givenArray: [3,4,1]))
//import XCTest
//
//class Letters {
//
//    let maxCount = 3
//
//    func solution(_ S: String) -> String
//    {
//        if S.count < maxCount
//        {
//            return S
//        }
//
//        let s = Array(S)
//
//        var ans: [Character] = []
//        ans.append(s[0])
//        ans.append(s[1])
//
//        for i in 2 ..< s.count
//        {
//            let c = s[i]
//
//            if s[i - 2] != c || s[i - 1] != c
//            {
//                ans.append(c)
//            }
//        }
//
//        return String(ans)
//    }
//}
//
//print(Letters().solution("eedaaad"))
//
//


extension Array where Element == Int {
    public static func newFunc(array1: [Int], array2: [Int]) -> [Int] {
        // start here
        var finalArray:[Int] = zip(array1,array2).map(+)
            let largerArray = array1.count > array2.count ? array1 : array2
            let smallerArray = array1.count > array2.count ? array2 : array1
            let min = smallerArray.count
            let max = largerArray.count
            for i in min..<max {
                finalArray.append(largerArray[i])
            }
            return finalArray
    }
}

print(Array.newFunc(array1: [1,2,3,4,8], array2: [1,2,3,5]))



//func combine2Arrays(array1:[Int], array2:[Int]) -> [Int] {
//    var finalArray:[Int] = zip(array1,array2).map(+)
//    let largerArray = array1.count > array2.count ? array1 : array2
//    let smallerArray = array1.count > array2.count ? array2 : array1
//    let min = smallerArray.count
//    let max = largerArray.count
//    for i in min..<max {
//        finalArray.append(largerArray[i])
//    }
//    return finalArray
//}
//
//print(combine2Arrays(array1: [1,2,3], array2: [1,2,3,5]))

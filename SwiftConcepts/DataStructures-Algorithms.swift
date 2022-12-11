/* Data Structures
    
    Array - an ordered collection of values, accessed by index. For example:
        let colors = ["red", "green", "blue"]

    Set - an unordered collection of unique values. For example:
        let uniqueNumbers = Set([1, 2, 3, 3, 4])

    Dictionary - a collection of key-value pairs, where keys are used to access values. For example:
        let ages = ["John": 25, "Jane": 30, "Bob": 40]

    Tuple - a fixed-size collection of values of different types, accessed by position. For example:
        let person = (name: "John", age: 25)

    Stack - a data structure that follows the Last In First Out (LIFO) principle, where the last element added to the stack is the first one to be removed. For example:
        var numberStack = Stack<Int>()
        numberStack.push(1)
        numberStack.push(2)
        numberStack.pop() // returns 2

    Queue - a data structure that follows the First In First Out (FIFO) principle, where the first element added to the queue is the first one to be removed. For example:
        var numberQueue = Queue<Int>()
        numberQueue.enqueue(1)
        numberQueue.enqueue(2)
        numberQueue.dequeue() // returns 1

    Linked List - a data structure where each element is connected to the next element through a reference, allowing for efficient insertion and deletion operations. For example:
        var linkedList = LinkedList<Int>()
        linkedList.append(1)
        linkedList.append(2)
        linkedList.remove(at: 1) // removes the second element

    Tree - a data structure that organizes data in a hierarchical structure, where each element (except the root) has a parent and may have multiple children. For example:
        let tree = TreeNode<String>("Food")
        let fruits = TreeNode<String>("Fruits")
        let vegetables = TreeNode<String>("Vegetables")
        tree.add(fruits)
        tree.add(vegetables)
        tree.children[0].add(TreeNode<String>("Apple"))
        tree.children[1].add(TreeNode<String>("Carrot"))
*/

/* Algorithms 

    Types:
        There are several types of algorithms in Swift, including:

        Sorting algorithms - 
            These algorithms help to arrange elements in a specific order, 
            such as ascending or descending. An example of a sorting algorithm is the bubble sort, 
            which compares adjacent elements and swaps them if they are out of order.

            Sorting algorithms types:
                Comparison-based algorithms: 
                    These algorithms compare elements in the array and rearrange 
                    them based on some criterion (e.g. ascending or descending order). 
                    Some examples of comparison-based sorting algorithms include 
                        bubble sort, quicksort, and mergesort.

                    */ // bubble sort function
                            func bubbleSort(_ array: [Int]) -> [Int] {
                            var sortedArray = array

                            for i in 0..<sortedArray.count {
                                for j in 0..<sortedArray.count - 1 - i {
                                if sortedArray[j] > sortedArray[j + 1] {
                                    // Swap values
                                    let temp = sortedArray[j]
                                    sortedArray[j] = sortedArray[j + 1]
                                    sortedArray[j + 1] = temp
                                }
                                }
                            }
                                return sortedArray
                            }

                            let array = [3, 5, 1, 4, 2]
                            let sortedArray = bubbleSort(array)
                            // sortedArray is now [1, 2, 3, 4, 5]

                        // quick sort example
                            func quickSort(_ array: [Int]) -> [Int] {
                                guard array.count > 1 else { return array }

                                let pivot = array[array.count/2]
                                let less = array.filter { $0 < pivot }
                                let equal = array.filter { $0 == pivot }
                                let greater = array.filter { $0 > pivot }

                                return quickSort(less) + equal + quickSort(greater)
                            }

                            let array = [9, 2, 3, 4, 5, 1, 6, 7, 8]
                            let sortedArray = quickSort(array)
                            // sortedArray is now [1, 2, 3, 4, 5, 6, 7, 8, 9]

                        // merge sort example
                            func mergeSort(_ array: [Int]) -> [Int] {
                              guard array.count > 1 else { return array }

                              let middleIndex = array.count / 2

                              let leftArray = mergeSort(Array(array[0..<middleIndex]))
                              let rightArray = mergeSort(Array(array[middleIndex..<array.count]))

                              return merge(leftArray, rightArray)
                            }

                            func merge(_ left: [Int], _ right: [Int]) -> [Int] {
                              var leftIndex = 0
                              var rightIndex = 0

                              var orderedArray: [Int] = []

                              while leftIndex < left.count && rightIndex < right.count {
                                if left[leftIndex] < right[rightIndex] {
                                  orderedArray.append(left[leftIndex])
                                  leftIndex += 1
                                } else if left[leftIndex] > right[rightIndex] {
                                  orderedArray.append(right[rightIndex])
                                  rightIndex += 1
                                } else {
                                  orderedArray.append(left[leftIndex])
                                  leftIndex += 1
                                  orderedArray.append(right[rightIndex])
                                  rightIndex += 1
                                }
                              }

                              while leftIndex < left.count {
                                orderedArray.append(left[leftIndex])
                                leftIndex += 1
                              }

                              while rightIndex < right.count {
                                orderedArray.append(right[rightIndex])
                                rightIndex += 1
                              }

                              return orderedArray
                            }

                            let array = [9, 2, 3, 4, 5, 1, 6, 7, 8]
                            let sortedArray = mergeSort(array)
                            // sortedArray is now [1, 2, 3, 4, 5, 6, 7, 8, 9]
                    /*                  
                Non-comparison-based algorithms: 
                    These algorithms do not rely on comparing elements in the array to sort them. 
                    Instead, they use other properties of the elements, such as their key or value, 
                    to determine their order in the final sorted array. 
                    Examples of non-comparison-based sorting algorithms include 
                        counting sort and radix sort.
                    
                    */ // counting sort example:
                            // Counting sort is an algorithm for sorting a collection of objects according to keys 
                            // that are small integers. It operates by counting the number of objects that have each distinct key 
                            // value, and using arithmetic on those counts to determine the positions of each key value in the output sequence.
                            func countingSort(array: [Int]) -> [Int] {
                              // First, find the minimum and maximum values in the array
                              let minValue = array.min()!
                              let maxValue = array.max()!

                              // Next, create an array of zeros with the length equal to the difference
                              // between the min and max values plus one. This will be used as a "counts" array.
                              let countsArray = Array(repeating: 0, count: maxValue - minValue + 1)

                              // Then, iterate over the input array and update the counts array with the
                              // number of occurrences of each value in the input array
                              for value in array {
                                  countsArray[value - minValue] += 1
                              }

                              // Next, iterate over the counts array, and use the values in the counts array
                              // to populate a new sorted array
                              var sortedArray = [Int]()
                              for (index, count) in countsArray.enumerated() {
                                for _ in 0..<count {
                                  sortedArray.append(index + minValue)
                                }
                              }

                              return sortedArray
                            }
                        
                            let array = [3, 1, 6, 4, 2]
                            let sortedArray = countingSort(array: array)
                            print(sortedArray)  // [1, 2, 3, 4, 6]

                        // radix sort example:
                            // Radix sort is a sorting algorithm that sorts data with integer keys by grouping the keys by 
                            // individual digits that share the same significant position and value
                            func radixSort(_ array: inout [Int]) {
                                // Determine the maximum number of digits
                                let maxDigits = array.map { Int(log10(Double($0))) + 1 }.max() ?? 0

                                // Perform counting sort on each digit
                                for i in 0..<maxDigits {
                                    var buckets: [[Int]] = .init(repeating: [], count: 10)

                                    for number in array {
                                        let digit = (number / Int(pow(10, Double(i)))) % 10
                                        buckets[digit].append(number)
                                    }

                                    array = buckets.flatMap { $0 }
                                }
                            }
                            var numbers = [1, 123, 456, 789, 45, 321, 654, 987]
                            radixSort(&numbers)
                            // numbers is now [1, 45, 123, 321, 456, 654, 789, 987]
                    /*

        Search algorithms - 
            These algorithms help to find a specific element in a given dataset. 
            An example of a search algorithm is the binary search, which divides the dataset into halves and 
            compares the target element to the middle element to determine the next step.

        Graph algorithms - 
            These algorithms help to find paths and relationships between elements in a graph 
            data structure. An example of a graph algorithm is the Dijkstra's algorithm, 
            which finds the shortest path between two nodes in a weighted graph.

        Dynamic programming algorithms - 
            These algorithms help to solve complex problems by breaking them down into smaller sub-problems 
            and solving them recursively. An example of a dynamic programming algorithm is 
            the Knapsack problem, which finds the optimal combination of items to include in a knapsack with limited capacity.

        Machine learning algorithms - 
            These algorithms use data and training examples to make predictions and decisions. 
            An example of a machine learning algorithm is the k-nearest neighbors algorithm, 
            which classifies data points based on their similarity to other points in the dataset.
*/


/* Time Complexity 

*/
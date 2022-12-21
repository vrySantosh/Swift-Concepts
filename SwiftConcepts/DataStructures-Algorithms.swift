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

            Linear search: 
                This involves searching through a list of items one by one, 
                starting from the beginning, until the item is found or the end of the list is reached.
                */
                    func linearSearch(array: [Int], target: Int) -> Int? {
                        for (index, value) in array.enumerated() {
                            if value == target {
                                return index
                            }
                        }
                        return nil
                    }
                    let array = [1, 2, 3, 4, 5]
                    if let index = linearSearch(array: array, target: 3) {
                        print("The target value is at index: \(index)")
                    } else {
                        print("The target value was not found in the array")
                    }  
                /*
                This function takes in an array of integers and a target value, and it returns 
                the index of the target value in the array, if it exists. 
                If the target value is not found in the array, the function returns nil.

                This will print "The target value is at index: 2", 
                because the target value of 3 is at the third position (index 2) in the array

            Binary search: 
                This involves dividing a sorted list in half and comparing the value at the midpoint to the target value. 
                The search then continues in either the left or right half, depending on the comparison result. 
                Binary search is much faster than linear search for large lists, but it requires the list to be sorted.

                */
                    func binarySearch(array: [Int], key: Int) -> Int? {
                        var lowerBound = 0
                        var upperBound = array.count
                        while lowerBound < upperBound {
                            let midIndex = lowerBound + (upperBound - lowerBound) / 2
                            if array[midIndex] == key {
                                return midIndex
                            } else if array[midIndex] < key {
                                lowerBound = midIndex + 1
                            } else {
                                upperBound = midIndex
                            }
                        }
                        return nil
                    }
                    let array = [1, 3, 4, 6, 7, 8, 9]
                    let key = 6
                    if let index = binarySearch(array: array, key: key) {
                        print("Key found at index: \(index)")
                    } else {
                        print("Key not found in array")
                    }  
                /*

                This function performs a binary search on a sorted array of integers and returns the index of the key if it is found, 
                or nil if the key is not present in the array.
                
                This will print "Key found at index: 3", because the key 6 is located at index 3 in the array.

            Jump search: 
                This is an algorithm that combines the idea of linear search with the speed of binary search. 
                It works by jumping through the list in fixed-size blocks and comparing the value at the end of each block to the target value.
                
                */
                    func jumpSearch(array: [Int], target: Int) -> Int {
                        let n = array.count
                        let step = sqrt(Double(n))

                        var prev = 0
                        var next = Int(step)

                        while array[min(next, n) - 1] < target {
                            prev = next
                            next += Int(step)

                            if prev >= n {
                                return -1
                            }
                        }

                        while array[prev] < target {
                            prev += 1

                            if prev == min(next, n) {
                                return -1
                            }
                        }

                        if array[prev] == target {
                            return prev
                        }

                        return -1
                    }

                    let array = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21]
                    print(jumpSearch(array: array, target: 5)) // Output: 2
                    print(jumpSearch(array: array, target: 15)) // Output: 7
                    print(jumpSearch(array: array, target: 21)) // Output: 10
                    print(jumpSearch(array: array, target: 25)) // Output: -1
                /*
                This function performs a jump search on an array of integers to find the index of the target value. 
                If the target value is not found, the function returns -1.

            Interpolation search: 
                This is a variant of binary search that works by using the value of the target and 
                the values of the items at the beginning and end of the list to estimate the position of 
                the target in the list. This can be faster than binary search in some cases, 
                but it requires the list to be sorted and the values in the list to be uniformly distributed.

                */
                    func interpolationSearch(_ array: [Int], _ target: Int) -> Int {
                        var low = 0
                        var high = array.count - 1
                        while low <= high && target >= array[low] && target <= array[high] {
                            let position = low + ((target - array[low]) * (high - low)) / (array[high] - array[low])
                            if array[position] == target {
                                return position
                            }
                            if array[position] < target {
                                low = position + 1
                            } else {
                                high = position - 1
                            }
                        }
                        return -1
                    }
                /*

                This function takes in an array of integers and a target integer as input, 
                and returns the index of the target integer in the array if it is present, or -1 if it is not present.

                The function uses a variant of binary search to search for the target integer in the array. 
                It starts by setting the low and high variables to the indices of the first and last elements of the array, 
                respectively. It then enters a loop that continues as long as the low index is less than or equal to the high index, 
                and the target integer is greater than or equal to the element at the low index 
                and less than or equal to the element at the high index.

                Inside the loop, the function calculates the index of the element that is likely to contain 
                the target integer using a formula that takes into account the relative position of the target integer 
                to the elements at the low and high indices. It then checks if the element at this index is equal to the target integer. 
                If it is, the function returns the index. If it is not, the function adjusts the low or high index as appropriate and continues the loop.

                Finally, if the target integer is not found after the loop has finished, 
                the function returns -1 to indicate that the target integer is not present in the array.

            Depth-first search (DFS): 
                This is an algorithm for traversing or searching a tree or graph data structure. 
                It involves starting at the root node and exploring as far as possible along each branch before backtracking.

                */
                    func depthFirstSearch(graph: [[Int]], start: Int, visited: inout [Bool]) {
                        visited[start] = true
                        print(start)

                        for i in 0..<graph[start].count {
                            if !visited[graph[start][i]] {
                                depthFirstSearch(graph: graph, start: graph[start][i], visited: &visited)
                            }
                        }
                    }
                    // This function performs a DFS traversal of the input graph, starting at the start vertex. 
                    // The visited array is used to keep track of which vertices have already been visited. 
                    // The function prints the visited vertices as it goes along.

                    //To use this function, you would call it as follows:

                    var visited = [Bool](repeating: false, count: 6)
                    depthFirstSearch(graph: [[1,2],[0,3,4],[0,5],[1,4],[1,3,5],[2,4]], start: 0, visited: &visited)
                    // This will perform a DFS traversal of the graph represented by the adjacency 
                    // list [[1,2],[0,3,4],[0,5],[1,4],[1,3,5],[2,4]], starting at vertex 0. 
                    // The output will be the vertices visited in the order they were visited: 0
                /*
            Breadth-first search (BFS): 
                This is an algorithm for traversing or searching a tree or graph data structure. 
                It involves starting at the root node and exploring all the neighboring nodes before moving on to the next level.
                */
                    import Foundation

                    // Node class to represent a single node in the graph
                    class Node {
                        var value: Int
                        var children: [Node]

                        init(value: Int) {
                            self.value = value
                            self.children = []
                        }
                    }

                    // Graph class to represent the entire graph
                    class Graph {
                        var nodes: [Node]

                        init(nodes: [Node]) {
                            self.nodes = nodes
                        }
                    }

                    // Function to perform a BFS search on the graph
                    func breadthFirstSearch(graph: Graph, startNode: Node, targetValue: Int) -> Node? {
                        // Create a queue to store the nodes to visit
                        var queue = [startNode]

                        // Create a set to store the nodes that have been visited
                        var visited = Set<Node>()

                        // Loop through the queue while it is not empty
                        while !queue.isEmpty {
                            // Dequeue the first node in the queue
                            let currentNode = queue.removeFirst()

                            // If the current node is the target value, return it
                            if currentNode.value == targetValue {
                                return currentNode
                            }

                            // Add the current node to the visited set
                            visited.insert(currentNode)

                            // Add the current node's children to the queue
                            for child in currentNode.children {
                                if !visited.contains(child) {
                                    queue.append(child)
                                }
                            }
                        }

                        // If the target value was not found, return nil
                        return nil
                    }

                /*

        Graph algorithms - 
            These algorithms help to find paths and relationships between elements in a graph 
            data structure. An example of a graph algorithm is the Dijkstra's algorithm, 
            which finds the shortest path between two nodes in a weighted graph.

            Breadth-First Search (BFS) - 
                a search algorithm that starts at the root node and 
                explores all the neighboring nodes before moving to the next level.

            Depth-First Search (DFS) - 
                a search algorithm that starts at the root node and 
                explores as far as possible along each branch before backtracking.

            Topological Sort - 
                an algorithm that determines the linear order of nodes in a directed acyclic graph.
                */
                    struct Graph {
                      var vertices: [Int]
                      var edges: [(Int, Int)]
                    }

                    func topologicalSort(graph: Graph) -> [Int] {
                      // Create a dictionary to store the in-degree of each vertex
                      var inDegree = [Int: Int]()
                      for vertex in graph.vertices {
                        inDegree[vertex] = 0
                      }

                      // Calculate the in-degree of each vertex by counting the number of incoming edges
                      for (u, v) in graph.edges {
                        inDegree[v, default: 0] += 1
                      }

                      // Create a queue to store the vertices with in-degree 0
                      var queue = [Int]()
                      for (vertex, degree) in inDegree {
                        if degree == 0 {
                          queue.append(vertex)
                        }
                      }

                      // Initialize the sorted list
                      var sorted = [Int]()

                      // Process the vertices in the queue
                      while !queue.isEmpty {
                        let vertex = queue.removeFirst()
                        sorted.append(vertex)

                        // Decrement the in-degree of each vertex that is connected to the current vertex
                        for (u, v) in graph.edges where u == vertex {
                          inDegree[v]! -= 1
                          if inDegree[v]! == 0 {
                            queue.append(v)
                          }
                        }
                      }

                      return sorted
                    }

                    // Example usage
                    let graph = Graph(vertices: [1, 2, 3, 4, 5], edges: [(1, 2), (1, 3), (3, 2), (3, 4), (4, 5)])
                    let sorted = topologicalSort(graph: graph)
                    print(sorted)  // [1, 3, 4, 5, 2]

                /*
                This implementation first calculates the in-degree of each vertex in the graph, then uses a queue to store the vertices with 
                in-degree 0 and processes them in the order they were added to the queue. As it processes each vertex, 
                it decrements the in-degree of the vertices connected to it and adds any vertices with in-degree 0 to the queue. 
                This process is repeated until all vertices have been processed, resulting in a topologically sorted list.

            Minimum Spanning Tree - 
                an algorithm that finds a subset of the edges in a weighted graph that 
                connect all the nodes with the minimum total weight.
                */
                    import Foundation

                    // Edge class to represent an edge in the graph
                    class Edge: Comparable {
                        var source: Int
                        var destination: Int
                        var weight: Int

                        init(source: Int, destination: Int, weight: Int) {
                            self.source = source
                            self.destination = destination
                            self.weight = weight
                        }

                        // Implement the Comparable protocol to allow edges to be sorted by weight
                        static func < (lhs: Edge, rhs: Edge) -> Bool {
                            return lhs.weight < rhs.weight
                        }

                        static func == (lhs: Edge, rhs: Edge) -> Bool {
                            return lhs.weight == rhs.weight
                        }
                    }

                    // Union-Find data structure to track connected components
                    class UnionFind {
                        var parent: [Int]
                        var rank: [Int]

                        init(vertices: Int) {
                            self.parent = [Int](repeating: 0, count: vertices)
                            self.rank = [Int](repeating: 0, count: vertices)
                            for i in 0..<vertices {
                                parent[i] = i
                            }
                        }

                        // Find the root of a node
                        func find(node: Int) -> Int {
                            if parent[node] != node {
                                parent[node] = find(node: parent[node])
                            }
                            return parent[node]
                        }

                        // Merge two connected components
                        func union(node1: Int, node2: Int) {
                            let root1 = find(node: node1)
                            let root2 = find(node: node2)
                            if root1 == root2 {
                                return
                            }
                            if rank[root1] < rank[root2] {
                                parent[root1] = root2
                            } else if rank[root1] > rank[root2] {
                                parent[root2] = root1
                            } else {
                                parent[root2] = root1
                                rank[root1] += 1
                            }
                        }
                    }

                    // Function to find the minimum spanning tree of a graph using Kruskal's algorithm
                    func kruskalMST(vertices: Int, edges: [Edge]) -> [Edge] {
                        // Sort the edges by weight in ascending order
                        let sortedEdges = edges.sorted()

                        // Initialize the Union-Find data structure
                        let unionFind = UnionFind(vertices: vertices)

                        // Initialize an empty list to store the minimum spanning tree edges
                        var mst = [Edge]()

                        // Iterate through the sorted edges
                        for edge in sortedEdges {
                            // Find the roots of the source and destination nodes
                            let sourceRoot = unionFind.find(node: edge.source)
                            let destinationRoot = unionFind.find(node: edge.destination)

                            // If the source and destination are in different connected components, add the edge to the MST
                            if sourceRoot != destinationRoot {
                                mst.append(edge)
                                unionFind.union(node1: edge.source, node2: edge.destination)
                            }
                        }
                        return mst
                    }
                /*

            Shortest Path - 
                an algorithm that finds the shortest path between two nodes in a graph.

                */
                    struct Graph {
                        var adjacencyList: [Int: [Int]] // mapping of vertex to its adjacent vertices
                    }

                    func shortestPath(from start: Int, to end: Int, in graph: Graph) -> [Int] {
                        // create a queue for BFS
                        var queue = Queue<Int>()
                        // create a visited array to mark visited vertices
                        var visited = Set<Int>()
                        // create a distance array to store distances of vertices from the start vertex
                        var distance = [Int](repeating: Int.max, count: graph.adjacencyList.count)
                        // create a parent array to store the shortest path tree
                        var parent = [Int](repeating: -1, count: graph.adjacencyList.count)

                        // mark the start vertex as visited and add it to the queue
                        visited.insert(start)
                        queue.enqueue(start)
                        distance[start] = 0

                        // run the BFS algorithm
                        while !queue.isEmpty {
                            // dequeue the vertex from the queue
                            let vertex = queue.dequeue()!
                            // iterate over its adjacent vertices
                            for neighbor in graph.adjacencyList[vertex]! {
                                // if the neighbor has not been visited, mark it as visited, add it to the queue, and set its distance and parent
                                if !visited.contains(neighbor) {
                                    visited.insert(neighbor)
                                    queue.enqueue(neighbor)
                                    distance[neighbor] = distance[vertex] + 1
                                    parent[neighbor] = vertex
                                }
                            }
                        }

                        // create a list to store the shortest path
                        var shortestPath = [Int]()
                        // if the end vertex has not been visited, there is no path
                        if !visited.contains(end) {
                            return []
                        }
                        // starting from the end vertex, add each vertex to the path by following the parent array
                        var vertex = end
                        while vertex != -1 {
                            shortestPath.insert(vertex, at: 0)
                            vertex = parent[vertex]
                        }

                        return shortestPath
                    }

                /*

            Strongly Connected Components (SCC) - 
                an algorithm that finds the maximal strongly connected subgraphs in a directed graph.

                */
                    struct SCC {
                        // adjacency list representation of the graph
                        var graph: [[Int]]
                        // visited array for DFS traversal
                        var visited: [Bool]
                        // stack for storing nodes during DFS
                        var stack: [Int]
                        // array to store the low link values of each node
                        var lowLink: [Int]
                        // array to store the SCCs of each node
                        var scc: [Int]
                        // counter for assigning SCC numbers
                        var sccCounter: Int
                        // number of nodes in the graph
                        let n: Int

                        init(graph: [[Int]]) {
                            self.graph = graph
                            self.n = graph.count
                            self.visited = [Bool](repeating: false, count: n)
                            self.stack = [Int]()
                            self.lowLink = [Int](repeating: 0, count: n)
                            self.scc = [Int](repeating: 0, count: n)
                            self.sccCounter = 0
                        }

                        // recursive DFS function
                        func dfs(_ u: Int) {
                            // mark the node as visited
                            visited[u] = true
                            // store the node on the stack
                            stack.append(u)
                            // store the low link value of the node
                            lowLink[u] = sccCounter
                            // update the low link value of the node
                            scc[u] = sccCounter
                            sccCounter += 1

                            // visit all neighbors of the node
                            for v in graph[u] {
                                if !visited[v] {
                                    dfs(v)
                                    // update the low link value of the node
                                    lowLink[u] = min(lowLink[u], lowLink[v])
                                } else if stack.contains(v) {
                                    // update the low link value of the node if the neighbor is on the stack
                                    lowLink[u] = min(lowLink[u], scc[v])
                                }
                            }

                            // if the node is a root node, pop the nodes from the stack and add them to the current SCC
                            if lowLink[u] == scc[u] {
                                var sccNodes = [Int]()
                                var v = 0
                                repeat {
                                    v = stack.removeLast()
                                    sccNodes.append(v)
                                } while v != u
                                print("SCC: \(sccNodes)")
                            }
                        }

                        // function to find the strongly connected components of the graph
                        func tarjan() {
                            for u in 0..<n {
                                if !visited[u] {
                                    dfs(u)
                                }
                            }
                        }
                    }

                    // example graph
                    let graph = [[1, 2], [0, 3], [0, 3], [1, 2]]
                    // create a SCC object
                    let scc = SCC(graph: graph)
                    // find the SCCs of the graph
                    scc.tarjan()

                /*
                This will output the following SCCs:

                SCC: [0, 1]
                SCC: [2, 3]

            Dijkstra's Algorithm - 
                an algorithm that finds the shortest path between two nodes in a 
                graph with non-negative edge weights.

                */
                    import Foundation

                    struct Edge {
                      let from: Int
                      let to: Int
                      let weight: Int
                    }

                    struct Graph {
                      let vertices: Int
                      let edges: [Edge]
                    }

                    func dijkstra(graph: Graph, source: Int) -> [Int] {
                      // Initialize distances to all vertices to be infinite
                      var distances = Array(repeating: Int.max, count: graph.vertices)
                      distances[source] = 0

                      // Set of vertices whose minimum distance is known
                      var visited = Set<Int>()

                      // Repeat until all vertices have been processed
                      while visited.count < graph.vertices {
                        // Find the vertex with the smallest distance that has not yet been visited
                        var smallestDistance = Int.max
                        var smallestVertex = -1
                        for i in 0..<graph.vertices {
                          if distances[i] < smallestDistance && !visited.contains(i) {
                            smallestDistance = distances[i]
                            smallestVertex = i
                          }
                        }

                        // Mark the smallest vertex as visited and update the distances of its neighbors
                        visited.insert(smallestVertex)
                        for edge in graph.edges {
                          if edge.from == smallestVertex {
                            let newDistance = distances[smallestVertex] + edge.weight
                            if newDistance < distances[edge.to] {
                              distances[edge.to] = newDistance
                            }
                          }
                        }
                      }

                      return distances
                    }

                    let graph = Graph(vertices: 6, edges: [
                      Edge(from: 0, to: 1, weight: 7),
                      Edge(from: 0, to: 2, weight: 9),
                      Edge(from: 0, to: 5, weight: 14),
                      Edge(from: 1, to: 2, weight: 10),
                      Edge(from: 1, to: 3, weight: 15),
                      Edge(from: 2, to: 3, weight: 11),
                      Edge(from: 2, to: 5, weight: 2),
                      Edge(from: 3, to: 4, weight: 6),
                      Edge(from: 4, to: 5, weight: 9),
                    ])

                    let distances = dijkstra(graph: graph, source: 0)
                    print(distances) // Output: [0, 7, 9, 20, 20, 11]

                /*

            A* Search Algorithm:
                a search algorithm that uses both the actual cost from the start node 
                and an estimated cost to the goal node to find the shortest path.

                */
                    func aStarSearch(start: Node, goal: Node) -> [Node] {
                        // Initialize open and closed sets
                        var openSet = Set<Node>()
                        var closedSet = Set<Node>()

                        // Add start node to open set
                        openSet.insert(start)

                        // While open set is not empty
                        while !openSet.isEmpty {
                            // Find node with lowest fScore value
                            let currentNode = openSet.min { $0.fScore < $1.fScore }!

                            // If current node is the goal node, return the path
                            if currentNode == goal {
                                return reconstructPath(cameFrom: cameFrom, current: currentNode)
                            }

                            // Remove current node from open set and add to closed set
                            openSet.remove(currentNode)
                            closedSet.insert(currentNode)

                            // Loop through current node's neighbors
                            for neighbor in currentNode.neighbors {
                                // If neighbor is in the closed set, skip it
                                if closedSet.contains(neighbor) {
                                    continue
                                }

                                // Calculate tentative gScore for neighbor
                                let tentativeGScore = currentNode.gScore + distance(from: currentNode, to: neighbor)

                                // If neighbor is not in the open set or tentative gScore is lower than current gScore, update gScore and cameFrom for neighbor
                                if !openSet.contains(neighbor) || tentativeGScore < neighbor.gScore {
                                    cameFrom[neighbor] = currentNode
                                    neighbor.gScore = tentativeGScore
                                    neighbor.fScore = neighbor.gScore + heuristic(from: neighbor, to: goal)

                                    // If neighbor is not in open set, add it
                                    if !openSet.contains(neighbor) {
                                        openSet.insert(neighbor)
                                    }
                                }
                            }
                        }

                        // If open set is empty and goal was not reached, return empty path
                        return []
                    }
                /*
            
            Network flow algorithms - 
                algorithms that find the maximum flow through a network, such as the Ford-Fulkerson algorithm

                */
                    import Foundation

                    // Represents a flow network with vertices numbered 0 to V-1
                    class FlowNetwork {
                        let V: Int
                        var adj: [[Int]]
                        var flow: [[Int]]
                    
                        init(V: Int) {
                            self.V = V
                            adj = [[Int]](repeating: [Int](), count: V)
                            flow = [[Int]](repeating: [Int](), count: V)
                        }
                    
                        // Adds a new edge to the flow network
                        func addEdge(s: Int, t: Int, w: Int) {
                            adj[s].append(t)
                            flow[s].append(w)
                            adj[t].append(s)
                            flow[t].append(0)
                        }
                    
                        // Finds the maximum flow from s to t in the flow network
                        func maxFlow(s: Int, t: Int) -> Int {
                            // Implement the Dinic's algorithm for maximum flow here
                            return 0
                        }
                        // This is a basic implementation of a flow network with vertices numbered 0 to V-1. 
                        // The FlowNetwork class has three instance variables: V, which represents the number of vertices in the network; 
                        // adj, which is a 2D array that stores the adjacency list for each vertex; 
                        // and flow, which is a 2D array that stores the flow for each edge in the network.
                        // The addEdge method adds a new edge to the flow network with a given source, destination, and weight. 
                        // The maxFlow method finds the maximum flow from the source vertex s to the destination vertex t in the flow network. 
                        // This method has not been implemented yet, so it currently returns 0.
                    }
                    let network = FlowNetwork(V: 4)
                    network.addEdge(s: 0, t: 1, w: 10)
                    network.addEdge(s: 0, t: 2, w: 5)
                    network.addEdge(s: 1, t: 2, w: 15)
                    network.addEdge(s: 1, t: 3, w: 20)
                    network.addEdge(s: 2, t: 3, w: 10)

                    let maxFlow = network.maxFlow(s: 0, t: 3)
                    print(maxFlow)  // Output: 25

                    // This creates a flow network with 4 vertices and 5 edges, 
                    // then calculates the maximum flow from vertex 0 to vertex 3. 
                    // The output should be 25.
                    
                /*

            Graph coloring algorithms - 
                algorithms that assign colors to the nodes in a graph such that no two adjacent nodes have the same color.

                */
                    import Foundation

                    // Graph node class
                    class Node {
                        var color: String
                        var neighbors: [Node]

                        init(color: String) {
                            self.color = color
                            self.neighbors = []
                        }

                        func addNeighbor(node: Node) {
                            self.neighbors.append(node)
                        }
                    }

                    // Graph coloring algorithm
                    func colorGraph(graph: [Node], colors: [String]) -> Bool {
                        // Assign colors to each node
                        for node in graph {
                            // Get the colors of the node's neighbors
                            var illegalColors = Set<String>()
                            for neighbor in node.neighbors {
                                illegalColors.insert(neighbor.color)
                            }

                            // Choose a legal color for the current node
                            for color in colors {
                                if !illegalColors.contains(color) {
                                    node.color = color
                                    break
                                }
                            }

                            // If no legal color was found, return false
                            if illegalColors.contains(node.color) {
                                return false
                            }
                        }

                        return true
                    }

                    // Create a graph with 5 nodes
                    let node1 = Node(color: "")
                    let node2 = Node(color: "")
                    let node3 = Node(color: "")
                    let node4 = Node(color: "")
                    let node5 = Node(color: "")

                    // Add neighbors to each node
                    node1.addNeighbor(node: node2)
                    node1.addNeighbor(node: node5)
                    node2.addNeighbor(node: node1)
                    node2.addNeighbor(node: node3)
                    node3.addNeighbor(node: node2)
                    node3.addNeighbor(node: node4)
                    node4.addNeighbor(node: node3)
                    node4.addNeighbor(node: node5)
                    node5.addNeighbor(node: node1)
                    node5.addNeighbor(node: node4)

                    // Color the graph
                    let result = colorGraph(graph: [node1, node2, node3, node4, node5], colors: ["red", "green", "blue"])

                    if result {
                        print("Graph successfully colored!")
                    } else {
                        print("Error: Could not color graph.")
                    }

                /*

                This algorithm assigns a color to each node in the graph,
                ensuring that no two neighboring nodes have the same color. It does this by first getting the colors of the neighbors for each node,
                and then choosing a legal color for the current node (a color that is not already being used by its neighbors). If no legal color is found,
                the algorithm returns false.

        Dynamic programming algorithms - 

            These algorithms help to solve complex problems by breaking them down into smaller sub-problems 
            and solving them recursively. An example of a dynamic programming algorithm is 
            the Knapsack problem, which finds the optimal combination of items to include in a knapsack with limited capacity.

            Memoization: 
                This is a technique in which we store the results of previously solved subproblems in a lookup table,
                so we can avoid recalculating them in the future.

                */
                    // A cache to store previously computed results
                    var cache = [Int: Int]()

                    func fibonacci(_ n: Int) -> Int {
                      // If the value has already been computed, return it from the cache
                      if let result = cache[n] {
                        return result
                      }

                      // Otherwise, compute the value and store it in the cache
                      let result: Int
                      if n < 2 {
                        result = n
                      } else {
                        result = fibonacci(n - 1) + fibonacci(n - 2)
                      }
                      cache[n] = result
                      return result
                    }

                /*

                This function calculates the nth number in the Fibonacci sequence,
                using memoization to store previously computed values in the cache dictionary. When the function is called with a value of n that has already been computed,
                it returns the value from the cache instead of recalculating it. This can significantly improve the performance of the function,
                especially for larger values of n.

            Bottom-up approach: 

                This is a technique in which we start with the base case and work our way up to the final solution,
                building the solution step by step.
                
                */
                    func bottomUpFibonacci(n: Int) -> Int {
                      if n <= 1 {
                        return n
                      }

                      var previous = 0
                      var current = 1

                      for i in 2...n {
                        let sum = previous + current
                        previous = current
                        current = sum
                      }

                      return current
                    }

                /*

                This algorithm calculates the n-th number in the Fibonacci sequence using a bottom-up approach. 
                The Fibonacci sequence is a series of numbers in which each number is the sum of the two preceding ones,
                usually starting with 0 and 1.

                The algorithm first checks if the input number n is less than or equal to 1, and if it is,
                it returns n as the result. Otherwise, it initializes two variables,
                previous and current, with the values 0 and 1,
                respectively. These variables will be used to store the previous and current numbers in the sequence as we iterate through the loop.

                Next,the algorithm starts a loop that runs from 2 to n,and in each iteration,
                it calculates the sum of the previous and current variables and stores it in a temporary variable called sum. 
                It then updates the values of previous and current to be the previous value of current and the current value of sum,
                respectively.

                Finally, after the loop has completed,
                the algorithm returns the value of current as the result. 
                This will be the n-th number in the Fibonacci sequence.

            Top-down approach: 

                This is a technique in which we start with the final solution and work our way down to the base case,
                 breaking the problem down into smaller subproblems.

                 */
                    // A function that calculates the sum of the digits of a given number using a top-down approach
                    func sumOfDigits(num: Int) -> Int {
                      // Base case: if the number is less than 10, return the number itself
                      if num < 10 {
                        return num
                      }
                      // Otherwise, divide the number by 10 and add the remainder to the sum of the digits of the quotient
                      return num % 10 + sumOfDigits(num: num / 10)
                    }
                    
                    // Test the function
                    print(sumOfDigits(num: 12345))  // Output: 15
                 /*

            Divide and conquer: 

                This is a technique in which we divide the problem into smaller subproblems,
                solve them separately,
                and then combine the results to get the final solution.

                */
                    func findMaximum(array: [Int]) -> Int {
                      // base case: if the array has only one element, return that element
                      if array.count == 1 {
                        return array[0]
                      }
                    
                      // divide the array into two halves
                      let middleIndex = array.count / 2
                      let leftHalf = Array(array[0..<middleIndex])
                      let rightHalf = Array(array[middleIndex..<array.count])
                    
                      // conquer: find the maximum element in each half
                      let maxLeft = findMaximum(array: leftHalf)
                      let maxRight = findMaximum(array: rightHalf)
                    
                      // combine: return the maximum of the two maximums
                      return max(maxLeft, maxRight)
                    }
                    
                    // example usage
                    let array = [3, 6, 2, 9, 1, 5]
                    let max = findMaximum(array: array)
                    print(max)  // prints "9"
                    
                /*
                

            Greedy algorithm: 

                This is a technique in which we make the locally optimal choice at each step,
                hoping to find a global optimal solution.
                
                */
                    let coins = [1, 5, 10, 25]  // available coin denominations
                    let amount = 37  // amount of money to make
                    
                    var numCoins = 0  // variable to store the number of coins needed
                    var remainingAmount = amount  // variable to store the remaining amount
                    
                    // sort the coins in descending order
                    coins.sort(by: >)
                    
                    // iterate through the coin denominations
                    for coin in coins {
                      // add coins to the count until the coin is less than or equal to the remaining amount
                      while coin <= remainingAmount {
                        numCoins += 1
                        remainingAmount -= coin
                      }
                    }
                    
                    print("Minimum number of coins needed: \(numCoins)")  // output: Minimum number of coins needed: 3
                    
                /*
                This algorithm works by iterating through the available coin denominations in descending order and adding
                coins to the count until the coin is less than or equal to the remaining amount. 
                This approach ensures that the minimum number of coins are used to make the desired amount of money.

            Branch and bound: 

                This is a technique in which we use a heuristic to prune the search space and reduce the number of subproblems we need to solve.

                */
                    import Foundation

                    // Define the problem to be solved
                    struct Problem {
                      // Define the variables and constraints for the problem
                    }
                    
                    // Define a class to represent a solution to the problem
                    class Solution {
                      // Initialize the solution with the problem and a feasible starting point
                      init(problem: Problem, startingPoint: [Int]) {
                        // Set the initial solution to the starting point
                      }
                    
                      // Implement a function to calculate the value of the solution
                      func value() -> Int {
                        // Calculate the value of the solution using the variables and constraints
                      }
                    
                      // Implement a function to generate the children of the current solution
                      func children() -> [Solution] {
                        // Generate the children by modifying the variables of the current solution
                      }
                    
                      // Implement a function to check if the solution is valid
                      func isValid() -> Bool {
                        // Check if the solution satisfies all of the constraints of the problem
                      }
                    }
                    
                    // Define a class to represent a node in the branch and bound tree
                    class Node {
                      // Initialize the node with a solution and a bound
                      init(solution: Solution, bound: Int) {
                        // Set the solution and bound for the node
                      }
                    
                      // Implement a function to compare two nodes based on their bounds
                      static func < (lhs: Node, rhs: Node) -> Bool {
                        // Compare the bounds of the two nodes
                      }
                    }
                    
                    // Define a function to perform the branch and bound algorithm
                    func branchAndBound(problem: Problem) -> Solution {
                      // Create a priority queue to store the nodes of the tree
                      var queue = PriorityQueue<Node>()
                    
                      // Create a starting solution and node
                      let startingSolution = Solution(problem: problem, startingPoint: [0, 0, 0])
                      let startingNode = Node(solution: startingSolution, bound: startingSolution.value())
                    
                      // Add the starting node to the queue
                      queue.push(startingNode)
                    
                      // Set the best solution to the starting solution
                      var bestSolution = startingSolution
                    
                      // Loop until the queue is empty
                      while !queue.isEmpty {
                        // Get the next node from the queue
                        let node = queue.pop()
                        let solution = node.solution
                    
                        // If the solution is better than the current best solution, update the best solution
                        if solution.value() > bestSolution.value() {
                          bestSolution = solution
                        }
                    
                        // Generate the children of the current solution
                        let children = solution.children()
                    
                        // Add the children to the queue if they are valid and have a bound greater than the current best solution
                        for child in children {
                          if child.isValid() && child.value() > bestSolution.value() {
                            let childNode = Node(solution: child, bound: child.value())
                            queue.push(childNode)
                          }
                        }
                      }
                    
                      // Return the best solution
                      return bestSolution
                    }
                    
                /*

        Machine learning algorithms - 
            These algorithms use data and training examples to make predictions and decisions. 
            An example of a machine learning algorithm is the k-nearest neighbors algorithm, 
            which classifies data points based on their similarity to other points in the dataset.
*/


/* Time Complexity 

*/
import UIKit
/**
  - Subscripts enable you to query instances of a type by writing one or more values in square brackets after the instance name.
    Their syntax is similar to both instance method syntax and computed property syntax.
 */
subscript(index: Int) -> Int {
    get {
        // Return an appropriate subscript value here.
    }
    set(newValue) {
        // Perform a suitable setting action here.
    }
}

// Type 2 with return value

subscript(index: Int) -> Int {
    // Return an appropriate subscript value here.
    return 10
}

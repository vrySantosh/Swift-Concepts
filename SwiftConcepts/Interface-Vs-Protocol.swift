/* 

In Swift,protocols and interfaces are similar in that they both define a set of requirements that a conforming type must implement. However,
there are some key differences between the two:

    Syntax: 
        Protocols are defined using the protocol keyword,
        while interfaces are not a concept in Swift.

    Inheritance: 
        Protocols can inherit from other protocols,
        allowing you to build upon existing requirements and create more complex abstractions. Interfaces,
        on the other hand,
        do not support inheritance in Swift.

    Default implementation: 
        Protocols can provide default implementations for some of their requirements using the extension keyword. 
        This allows conforming types to satisfy the requirements of the protocol without having to implement every single method or property. 
        Interfaces do not support default implementations.

    Type constraints: 
        Protocols can define type constraints,
        which allow you to specify that a conforming type must be a specific type or a subclass of a specific type. 
        Interfaces do not support type constraints.


Overall,
    protocols are a more powerful and flexible tool for defining abstractions in Swift,
    while interfaces do not exist as a language feature. Protocols are often used in combination with other language features,
    such as generics and extensions,
    to create reusable and modular code.

*/

// Protocol with method and property requirements
protocol TextValidator {
    var maxLength: Int { get }
    func validate(_ text: String) -> Bool
}

// Interface with method requirements only
interface EmailValidator {
    func validate(_ text: String) -> Bool
}

// Struct that conforms to the protocol
struct EmailValidatorStruct: TextValidator {
    var maxLength: Int = 100
    func validate(_ text: String) -> Bool {
        // Implementation goes here
        return true
    }
}

// Class that implements the interface
class EmailValidatorClass: EmailValidator {
    func validate(_ text: String) -> Bool {
        // Implementation goes here
        return true
    }
}

//import UIKit
//
func ABCheck(msg str: String, finalSelector:() -> ()) -> String
{
    // Calling Closure
    finalSelector()
    return "finalSelector"
}

// Parameter Closure

ABCheck(msg:"hajdajfa", finalSelector: {
    print("new closure method")
    
})

// Tailing Closure
// When the functiona accepts closure for the final argument
ABCheck(msg:"message") {
    print("Tailing clousre")
}


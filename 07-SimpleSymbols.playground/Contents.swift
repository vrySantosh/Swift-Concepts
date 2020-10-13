import UIKit

func checkSymbols(_ str: String) -> Bool
{
    var check = false
    
    var regexx = try! NSRegularExpression(pattern: #"[A-Za-z]"#, options: [])
    var neww = str.replacingOccurrences(of: regexx.pattern, with: "", options: .regularExpression)
    if neww.count > 0 {
        check = true
    }
    return check
 
}

checkSymbols("adafaf@#@$")


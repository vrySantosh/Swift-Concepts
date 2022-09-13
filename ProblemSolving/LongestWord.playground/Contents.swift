import UIKit

// Regular Expression

func longestWord(_ sen:inout String) -> String
{
    var longestWord = ""
    var longestLength = 0
    
    var regexx = try! NSRegularExpression(pattern: #"[^A-Za-z\s]"#, options:[])
    
    sen = sen.replacingOccurrences(of: regexx.pattern, with: "", options: .regularExpression)
    
    var senArray = sen.split(separator: " ")
    for i in stride(from: 0, to: senArray.count, by: 1) {
        if senArray[i].count > longestLength {
            longestLength = senArray[i].count
            longestWord = String(senArray[i])
        }
    }
    
    return longestWord
}


var sentence = "dahdjada,... dad866998989898@@@@@#@ad dadaddadadddasesdf"
longestWord(&sentence)

//Solution using Array Sort() methods
func longestWord2(_ sen:inout String) -> String
{
    
    var regexx = try! NSRegularExpression(pattern: #"[^A-Za-z\s]"#, options:[])
    
    sen = sen.replacingOccurrences(of: regexx.pattern, with: "", options: .regularExpression)
    
    var senArray = sen.split(separator: " ")
    
    var sorted = senArray.max(by: {(a, b) -> Bool in
                    return a.count < b.count
                    })
    
    
    return String(sorted!)
}
var sentence2 = "dahdj,. dad8669989ada dadadd(O868adad3424ddasesdf"
longestWord2(&sentence2)





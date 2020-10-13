import UIKit

func AlphabetSoup(_ str: String) -> String
{
    var strArray = Array(str.uppercased())
    
    return String(strArray.sorted())
}
AlphabetSoup("Santosh")

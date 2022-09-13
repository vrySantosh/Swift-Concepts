import UIKit

func letterCapitalize(_ str:inout String) -> String
{
//    var strArray = str.split(separator: " ")
//
//    for i in strArray {
//        strArray[i] = strArray[i][0].toUppercase() + strArray[i].substr(1)
//    }
//
    return str.capitalized
}

var string = "SantosWESDSASAh"
letterCapitalize(&string)

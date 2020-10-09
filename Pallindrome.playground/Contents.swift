import UIKit

func palindrome(str: String) -> Void
{
    let givenString = str
    let reversedString = String(str.reversed())
    if reversedString.capitalized == givenString.capitalized {
        print("the gien string is palindrome")
    }
    else
    {
        print("string is not palindrome")
    }
}
palindrome(str: "moxom")

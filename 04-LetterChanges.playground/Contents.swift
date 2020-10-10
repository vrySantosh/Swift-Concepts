func LetterChanges(_ str:inout String) -> String
{
    var alpha = "abcdefghijklmnopqrstuvwxyz"
    var newAlpha = "bcdEfghIjklmnOpqrstUvwxyzA"
    
    var strArray = Array(str)
    var newAlphaArray = Array(newAlpha)
    var answer: [Character] = [] as Array
    
    for i in stride(from: 0, to: strArray.count, by: 1) {
        var index = alpha.firstIndex(of: strArray[i])
        if index.hashValue != -1 {
            answer.append(newAlphaArray[i])
        }
        else
        {
            answer.append(strArray[i])
        }
    }
    
    return String(answer)
    
}
var input = "abcdefghijklmnopqrstuvwxyz"
LetterChanges(&input)

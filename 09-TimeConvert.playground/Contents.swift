import UIKit

func timeConvert(_ num: Float) -> String
{
    let hours = round(num/60)
    let minutes = Int(num) % 60
    let timeString = String(format: "%.fHours:%dMinutes",hours,minutes)
    
    return timeString
}

timeConvert(125)


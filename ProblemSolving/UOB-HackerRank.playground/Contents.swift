import UIKit

func pthFactor(_ n:Double,_ p:Int) -> Double
{
    var factors  = [1, abs(n)]
    var startIndex = 0
    
    for i in stride(from: 2, through: sqrt(n), by: 1) {
        if (n.truncatingRemainder(dividingBy: i)) == 0 {
            startIndex += 1
            factors.removeSubrange(startIndex...Int(i))
        
            if (n/i) != i {
            factors.removeSubrange(startIndex+1 ... Int(n/i))
            }
        }
        
    }
    return factors.contains(where: { $0.hashValue == p-1}) ? factors[p-1] : 0
}

print(pthFactor(3, 10))


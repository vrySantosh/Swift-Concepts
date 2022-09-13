func simpleAdding(_ num: Int) -> Int
{
    var sum = 0
    for i in stride(from: 1, through: num, by: 1)
    {
        sum += i
    }
    return sum
}

// Recursive solution
func simpleAdding2(_ num:inout Int,_ sum:inout Int) -> Int
{
    //    In-out parameters are passed as follows:
    //
    //    When the function is called, the value of the argument is copied.
    //    In the body of the function, the copy is modified.
    //    When the function returns, the copy’s value is assigned to the original argument.
    
    
    if num == 0
    {
        return sum;
    }
    
    sum += num
    
    num -= 1
    
    return simpleAdding2(&num, &sum)
}

var num = 5;
var sum = 15
simpleAdding(num)
simpleAdding2(&num, &sum)

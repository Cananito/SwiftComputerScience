
func recursiveFibonacci(position: Int) -> Int {
    if position < 2 {
        return position
    } else {
        return recursiveFibonacci(position - 1) + recursiveFibonacci(position - 2)
    }
}

func iterativeFibonacci(position: Int) -> Int {
    if position == 0 {
        return 0
    }
    var result = 1
    var first = 0
    var second = 1
    for (var index = 2; index <= position; index++) {
        result = first + second
        first = second
        second = result
    }
    return result
}

//recursiveFibonacci(0)
//recursiveFibonacci(1)
//recursiveFibonacci(2)
//recursiveFibonacci(3)
//recursiveFibonacci(4)
//recursiveFibonacci(5)
//recursiveFibonacci(6)
//recursiveFibonacci(7)
//recursiveFibonacci(8)
//recursiveFibonacci(9)

//iterativeFibonacci(0)
//iterativeFibonacci(1)
//iterativeFibonacci(2)
//iterativeFibonacci(3)
//iterativeFibonacci(4)
//iterativeFibonacci(5)
//iterativeFibonacci(6)
//iterativeFibonacci(7)
//iterativeFibonacci(8)
//iterativeFibonacci(9)

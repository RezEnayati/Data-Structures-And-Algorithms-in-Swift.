import Foundation

//MARK: -  Recursion: The process in which a function calls itself direclty or indireclty is called Recursion.

//MARK: -  Factorial using Recursion
func factorial(number: Int) -> Int {
    if number == 0{ //Base Case
        return 1
    }
    return number * factorial(number: number - 1) //Recursive Case
}

let results = factorial(number: 6)
//print(results)

//MARK: -  Power Function using Recursion
func power(number: Int, n: Int) -> Int {
    if n == 0 {
        return 1
    } else {
        return number * power(number: number, n: n-1)
    }
}
//print(power(number: 5, n: 3))

//MARK: -  Fibonacci using Recursion
func fib(index n: Int)-> Int{
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    }else{
        return fib(index: n-1) + fib(index: n-2)
    }
}
print(fib(index: 4))

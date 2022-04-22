//MARK: -  Passing in a function as an input to another function:
//func calculator(n1: Int, n2: Int) -> Int {
//    return n1 + n2
//}

// Let's say we want to change the functionality of the calculate function, for example making it calculate the multiplication or subtraction, in this case we can reuse the function and and pass the addition function into it.

//func add (no1: Int , no2: Int) -> Int { //Basically: (Int, Int) -> Int
//    return no1 + no2
//}

//func multiply(no1: Int , no2: Int) -> Int { //Basically: (Int, Int) -> Int
//    return no1 * no2
//}

// We are passing the add function as the operation in the function bellow, the data type is a function.

func calculator(n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

//calculator(n1: 3, n2: 2, operation: add) //we can pass in the add function as a paramenter becacuse the data types are the same.
//calculator(n1: 5, n2: 2, operation: subtraction) //we can pass the subtraction function because the data types are the same as the one sepecfied in the calc func.

//MARK: -  Using a function as a return type of another function:

//we can simplyfy the code above using a closure: Anonymous functions, functions whitout a name.

/*

 To turn a function into a closure:
 
 1. Remove the keyword "func" and the name of the closure.
 2. Replace the opeining bracket to the begining of the closure and replace it with the keyword "in"
 
 The sum function in cloosure form:
 { (no1: Int , no2: Int) -> Int in
     return no1 + no2
 }
 
*/

calculator(n1: 5, n2: 4, operation:  { (no1: Int , no2: Int) -> Int in
    return no1 + no2
})

//We can use swift ability of type inferance meaning it figures out the dataype base on the input to make the code even more simpler.
// So you can get rid of the input type and the return type in the closure.

calculator(n1: 5, n2: 4, operation:  { (no1, no2) in
    return no1 + no2
})

// We can also get rid of the return keyword inside the closure.

calculator(n1: 5, n2: 4, operation:  { (no1, no2) in no1 + no2 })

/* Closures also have the ability to provide anonymus paramater names:
 
 $0 , refers to the first parameter
 $1 , refers to the second parameter
 
*/

let result1 = calculator(n1: 5, n2: 4, operation: {$0 + $1})
//print(result1)

//The code can be broken down more: if the last parameter is a closure you can ommit the last parameter name. which is called a trailing closure:

let result = calculator(n1: 5, n2: 4) {$0 + $1}
//print(result)

let array = [6,2,3,9,4]

let newArray = array.map{"\($0)"}
print(newArray)

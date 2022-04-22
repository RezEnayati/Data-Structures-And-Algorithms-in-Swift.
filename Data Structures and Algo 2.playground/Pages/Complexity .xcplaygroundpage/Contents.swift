//MARK: -  Constant time: O(1)

let names: [String] = ["Mamad","Reza", "Ali", "Mehdi"]

func checkFirst(names: [String]){
    if let first = names.first{
        print(first)
    }else{
        print("Name not found")
    }
}
// checkFirst(names: names)

//MARK: -  Linear Time: O(n)

func printNames(names: [String]){
    for name in names {
        print(name)
    }
}
// printNames(names: names)

//MARK: -  Quadratic Time: O(n^2)

func printNames2(names: [String]){
    for _ in names {
        for name in names {
            print(name)
        }
    }
}
printNames2(names: names)

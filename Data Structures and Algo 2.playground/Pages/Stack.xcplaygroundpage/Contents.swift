import Foundation

//MARK: -  Stack - LIFO: Last in first Out.

struct Stack<Element> {
    
    private var storage :[Element] = [] //container for the stack
    init(){}
    
    mutating func push(_ element: Element){
        storage.append(element)
    }
    
    mutating func pop() -> Element? {
        return storage.popLast()
    }
}

extension Stack: CustomStringConvertible {
    
    var description: String {
        
        let topDevider = "----TOP----\n"
        let bottomDevider  = "\n-----------"
        
        let stackElements = storage.map {"\($0)"}.reversed().joined(separator: "\n")
        return topDevider + stackElements + bottomDevider
    }
}

var stack = Stack<Int>()

stack.push(20)
stack.push(3)
stack.push(4)
stack.push(99)
print("Before poping")
print(stack)
print("After poping")
stack.pop()
print(stack)

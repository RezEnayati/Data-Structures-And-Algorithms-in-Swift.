import UIKit
import Darwin

// The tree is build from multiple nodes.
// The top most node which does not have a parent, is called the Root node.
// The lower most nodes which do not have any children are called the leaves.

//MARK: -  Queue
struct Queue<Element> { //FIFO: First in first out
    
    
    var array: [Element] = []
    init(){}
    
    var isEmpty: Bool{
        return array.isEmpty
    }
    mutating func enQueue(_ value: Element){
        array.append(value)
    }
    
    mutating func deQueue() -> Element?{
        return isEmpty ? nil : array.removeFirst()
    }
}
extension Queue: CustomStringConvertible {
    
    var description: String{
        if isEmpty {
            return "Empty Queue"
        } else {
            return array.map{"\($0)"}.joined(separator: "\n")
        }
    }
}

//MARK: -  Tree
class TreeNode <T>{
    var value: T
    var children: [TreeNode] = []
    
    init(_ value: T) {
        self.value = value
    }
    
    func add(_ child: TreeNode){
        self.children.append(child)
    }
}

extension TreeNode where T: Equatable {
    
    //MARK: -  Depth First Traversal: using recursion (DFS)
    //Depth First Traversal: Goes through the nodes in the Tree starting the most left one and the deepest then it moves to the right nodes but still deep into the nodes.
    func foreachDepthFirst(_ visit:(TreeNode) -> Void){
        visit(self)
        children.forEach {
            $0.foreachDepthFirst(visit)
        }
    }
    
    //MARK: -  Level Order Traversing: using recursion
    // Level Order Traversal: Goes by Level
    func forEachLevelOrder(_ visit:(TreeNode) -> Void){
        
        visit(self)
        var queue = Queue<TreeNode>()
        children.forEach {
            queue.enQueue($0)
        }
        while let node = queue.deQueue() {
            visit(node)
            node.children.forEach{ queue.enQueue($0)}
        }
        while let node = queue.deQueue() {
            visit(node)
            node.children.forEach{(queue.enQueue($0))}
        }
    }
    
    func search(_ value: T) -> TreeNode? {
        
        var result: TreeNode?
        forEachLevelOrder{node in
            if node.value == value {
                result = node
            }
        }
        return result
        
    }
}

let drinks = TreeNode<String>("Bevereges")

let hot = TreeNode<String>("Hot")
let cold = TreeNode<String>("Cold")

drinks.add(hot)
drinks.add(cold)

let tea = TreeNode<String>("Tea")
let coffe = TreeNode<String>("Coffee")

hot.add(tea)
hot.add(coffe)

let soda = TreeNode<String>("Soda")
let milk = TreeNode<String>("Milk")

cold.add(milk)
cold.add(soda)

//drinks.foreachDepthFirst {
//    print($0.value)
//}

//drinks.forEachLevelOrder { print($0.value)}

if let searchResult = drinks.search("Milk") {
    print(searchResult.value)
}

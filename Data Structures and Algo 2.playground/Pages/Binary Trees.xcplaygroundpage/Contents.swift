//Binary Trees
import Foundation

class BinaryNode <Element> {
    
    var value: Element
    var leftChild: BinaryNode?
    var rightChild: BinaryNode?
    
    init(_ value: Element){
        self.value = value
    }
}

extension BinaryNode {
    
    //MARK: -  In Order Traversal: In this type of traversal we visit the left most nodes first and then to the top and right after.
    
    func traverseInOrder(visit: (Element) ->  Void){
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
        
    }
    
    //MARK: -  Post Order Traversal: The root or the parent is visited only after the children.
    
    func traversePostOrder(visit: (Element)->Void){
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }

    //MARK: -  Pre Order Traversal: The root or the parent is visited first and then the children.
    
    func traversePreOrder(visit: (Element)->Void){
        
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
        
    }
    
}

let ten = BinaryNode<Int>(10)
let nine = BinaryNode<Int>(9)
let two = BinaryNode<Int>(2)
let one = BinaryNode<Int>(1)
let three = BinaryNode<Int>(3)
let four = BinaryNode<Int>(4)
let six = BinaryNode<Int>(6)

ten.leftChild = nine
ten.rightChild = two
nine.leftChild = one
nine.rightChild = three
two.leftChild = four
two.rightChild = six

//ten.traverseInOrder{
//    print($0)
//}

ten.traversePreOrder{print($0)}

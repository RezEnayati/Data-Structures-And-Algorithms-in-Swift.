import Foundation

// Binary Search Tree, nodes smaller than the parent are on the right, nodes larger than the parent are on the left.

// Cuts down complexity of searching to O (Log n).
class BinaryNode<Element> {
    
    var value: Element
    
    var leftChild: BinaryNode?
    var righttChild: BinaryNode?
    
    init(_ value: Element){
        self.value = value
    }
    
    //Gives us the minimum node value using recurison and computed properties:
    var min: BinaryNode {
        return leftChild?.min ?? self
    }
}

//For printing the BinaryNode Only
extension BinaryNode: CustomStringConvertible {
    public var description: String {
        return diagram(for: self)
    }
    private func diagram(for node: BinaryNode?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.leftChild == nil && node.righttChild == nil {
            return root + "\(node.value)\n"
        }
        return diagram(for: node.righttChild,
                       top + " ", top + "|--", top + "| "
                       
        )
    }
}

struct BinarySearchTree <Element : Comparable> {
    
    private(set) var root :BinaryNode<Element>?
    
    init(){}
    
}

//For Printing Only
extension BinarySearchTree: CustomStringConvertible {
    
    var description: String {
        guard let root = root else { return "Empty Tree"}
        return String(describing: root)
        
        
    }
}

//Functions:
extension BinarySearchTree {
    
    
    //MARK: -  Insert functions
    
    //This function is a helper function.
    mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        
        guard let node = node else {
            return BinaryNode(value)
        }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.righttChild = insert(from: node.righttChild, value: value)
        }
        return node
    }
    
    //MARK: -  Searching
    
    func contains(_ value: Element) -> Bool {
        
        var current = root
        
        while let node = current {
            if node.value == value{
                return true
            }
            if node.value < node.value  {
                current = node.leftChild
            } else {
                current = node.righttChild
            }
        
        }
        
        return false
    }
    
    //MARK: -  Remove Function
    mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        
        guard let node = node else {
            return nil
        }
        if value == node.value {
            
            if node.leftChild == nil && node.righttChild == nil {
                return nil
            }
            
            if node.leftChild == nil {
                return node.righttChild
            }
            if node.righttChild == nil {
                return node.leftChild
            }
            
            node.value = node.righttChild!.min.value
            node.righttChild = remove(node: node.righttChild, value: node.value)
            
            
        }else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        }else {
            node.righttChild = remove(node: node.righttChild, value: value)
        }
        return node
    }
}


var bst = BinarySearchTree<Int>()

bst.insert(3)
bst.insert(1)
bst.insert(4)
bst.insert(0)
bst.insert(2)
bst.insert(5)

//print(bst)
print(bst.contains(5))

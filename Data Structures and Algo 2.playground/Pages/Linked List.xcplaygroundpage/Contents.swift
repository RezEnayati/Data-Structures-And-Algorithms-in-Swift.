import Foundation

//MARK: -  Implementing the LinkedList

struct LinkedList<Value>{
    var head: Node<Value>?
    var tail: Node<Value>?
        
    var isEmpty: Bool {
        return head == nil
    }
    
    //Push: adds a node to the begiging of the list
    mutating func push(_ value: Value){
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    //Apend: adds a value at the end of the linked list making it the tail
    mutating func append(_ value: Value){
        guard !isEmpty else {
            push(value)
            return
        }
        let node = Node(value: value)
        tail!.next = node
        tail = node
    }
    
    //Insert: inserting a node inbetween other nodes
    func node(at index:Int) -> Node<Value>?{
        var currentIndex = 0
        var currentNode = head
    
        while(currentNode != nil && currentIndex < index){
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    func insert(_ value: Value, after node: Node<Value>){
        
        node.next = Node(value: value, next: node.next)
        
    }
    
    //Pop: Removing the Head in the linked list and the next node will be the head
    mutating func pop() -> Value?{
        
        //The defer code block executes after return
        defer {
            head = head?.next
            if isEmpty{
                tail = nil
            }
        }
        return head?.value
    }
    
    //Remove Last: removes the tail of the list O(n)
    
    mutating func removeLast() -> Value? {
        
        //if the list is empty
        guard let head = head else {
            return nil
        }
        
        //if there is only one item in the list
        guard head.next != nil else {
            return pop()
        }
        
        
        var prev = head
        var current = head
        
        //Iterate through the linked list until the next is nil
        while let next = current.next {
            prev = current
            current = next
        }
        
        prev.next = nil
        tail = prev
        return current.value
        
    }
    
    //Remove After: removing an item after a certain Node O(n)
    
    mutating  func remove(after node: Node<Value>) -> Value? {
        
        defer {
            if node.next === tail {
                tail = node
            }
            
            //skips the next and points to the one after
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    
    
    init(){}
}

extension LinkedList:CustomStringConvertible{
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
}

//MARK: -  Creating the Node Class

class Node <Value> {
    var value: Value
    var next: Node?
    
    init(value: Value, next:Node? = nil){
        self.value = value
        self.next = next
    }
}

extension Node:CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + ""
    }
}

var list = LinkedList<Int>()
list.append(10)
list.append(3)
list.append(122)
list.append(24)

print(list)

let index = 10
let node = list.node(at: index - 1)!
let removedValue = list.remove(after: node)

print(list)

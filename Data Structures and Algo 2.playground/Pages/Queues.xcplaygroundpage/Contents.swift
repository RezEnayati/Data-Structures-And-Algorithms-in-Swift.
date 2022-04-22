import Foundation
//MARK: -  Queues: FIFO: First in first out.

struct Queue<T> {
    var array: [T] = []
    init(){}
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    //MARK: -  Peek: Returnes the first item inserted.
    var peek :T? {
        return array.first
    }
    
    //MARK: -  Enqueue: Add items to the Queue.
    mutating func enQueue(_ value: T) -> Bool{
        array.append(value)
        return true
    }
    
    //MARK: -  Dequeue: remove item from the queue.
    mutating func deQueue () -> T?{
        return isEmpty ? nil : array.removeFirst()
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        
        let topBoundry   = "----------\n"
        let lowerBoundry = "\n----FIRST-----"
        
        let elements = array.map{"\($0)"}.joined(separator: "\n")
        return topBoundry + elements + lowerBoundry
        
    }
    
}

var queue = Queue<Int>()
queue.enQueue(2)
queue.enQueue(3)
queue.enQueue(4)
print("Before Dequeue")
print(queue)
print("After Dequeuing")
queue.deQueue() //the last item added is the first one out
print(queue)

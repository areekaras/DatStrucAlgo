import Darwin
import Foundation

//MARK:- QUEUE implementation

class Node<T> {
    var data: T?
    var next: Node<T>?
    
    init(data: T? = nil) {
        self.data = data
    }
}

protocol QueueProtocol {
    associatedtype Element
    
    var peak: Element? { get }
    var isEmpty: Bool { get }
    
    mutating func enqueue(_ element: Element)
    mutating func dequeue() -> Element?
}

class Queue<Element>: QueueProtocol {
    
    fileprivate var head: Node<Element>?
    private var tail: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var peak: Element? {
        return head?.data
    }
    
    func enqueue(_ element: Element) {
        let newNode = Node(data: element)
        
        guard head != nil else {
            head = newNode
            tail = newNode
            return
        }
        
        tail?.next = newNode
        tail = newNode
    }
    
    func dequeue() -> Element? {
        guard let headItem = head?.data else {
            head = nil
            tail = nil
            return nil
        }
        
        if head?.next != nil {
            head = head?.next
        } else {
            head = nil
            tail = nil
        }
        return headItem
    }
    
}



//MARK:- Iteration pattern
extension Queue: Sequence {
    func makeIterator() -> QueueIterator<Element> {
        return QueueIterator(self)
    }
}

struct QueueIterator<T>: IteratorProtocol {
    private let queue: Queue<T>
    private var currentNode: Node<T>?
    
    init(_ queue: Queue<T>) {
        self.queue = queue
        self.currentNode = queue.head
    }
    
    mutating func next() -> T? {
        guard let node = currentNode else {
            return nil
        }
        
        let item = node.data
        currentNode = node.next
        return item
    }
}



//MARK:- Testing

let queue = Queue<Int>()

print("Queue is empty: \(queue.isEmpty)")

queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)

for item in queue {
    print(item)
}

print("Queue peek element: \(queue.peak)")

queue.dequeue()
queue.dequeue()
queue.enqueue(5)


for item in queue {
    print(item)
}

print("Queue peek element: \(queue.peak)")

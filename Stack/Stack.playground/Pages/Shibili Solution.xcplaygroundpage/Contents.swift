import Foundation

protocol StackProtocol {
    associatedtype Element
    
    var isEmpty: Bool { get }
    var count: Int { get }
    var top: Element? { get }
    
    mutating func push(element: Element)
    mutating func pop() -> Element?
}

struct Stack<Element>: StackProtocol {
    private var stackArray: [Element] = []
    
    var isEmpty: Bool {
        return stackArray.isEmpty
    }
    
    var count: Int {
        return stackArray.count
    }
    
    var top: Element? {
        return stackArray.last
    }
    
    mutating func push(element: Element) {
        stackArray.append(element)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        return stackArray.removeLast()
    }
    
}

extension Stack: CustomStringConvertible {
    var description: String {
        var result = ""
        for element in self.stackArray {
            result = "\(element)\n" + result
        }
        
        return "----Stack----\n" + result + "-------------\n"
    }
}



//var stack = Stack<Int>()
//stack.push(element: 5)
//stack.push(element: 3)
//stack.push(element: 6)
//stack.push(element: 8)
//
//print(stack)
//
//print("last : \(stack.top!)")
//
//
//stack.pop()
//stack.pop()
//
//print(stack)



var stack = Stack<String>()
stack.push(element: "ONE")
stack.push(element: "TWO")
stack.push(element: "THREE")
stack.push(element: "FOUR")

print(stack)

print("last : \(stack.top!)")


stack.pop()
stack.pop()

print(stack)


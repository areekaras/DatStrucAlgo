
protocol StackProtocol {
    associatedtype Element
    
    var isEmpty: Bool { get }
    var count: Int { get }
    var peek: Element? { get }
    
    func push(element: Element)
    @discardableResult func pop() -> Element?
}

class Stack<T>: StackProtocol {
    private var stackArray: [T] = []
    
    var isEmpty: Bool {
        return stackArray.isEmpty
    }
    
    var count: Int {
        return stackArray.count
    }
    
    var peek: T? {
        return stackArray.last
    }
    
    func push(element: T) {
        stackArray.append(element)
    }
    
    
    func pop() -> T? {
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



//let stack = Stack<Int>()
//stack.push(element: 5)
//stack.push(element: 3)
//stack.push(element: 6)
//stack.push(element: 8)
//
//print(stack)
//
//print("last : \(stack.peek!)")
//
//
//stack.pop()
//stack.pop()
//
//print(stack)



let stack = Stack<String>()
stack.push(element: "ONE")
stack.push(element: "TWO")
stack.push(element: "THREE")
stack.push(element: "FOUR")

print(stack)

print("last : \(stack.peek!)")


stack.pop()
stack.pop()

print(stack)


import Foundation
import XCTest

protocol StackProtocol {
    associatedtype Element
    
    var isEmpty: Bool { get }
    var count: Int { get }
    
    mutating func push(_ element: Element)
    mutating func pop() -> Element?
    func peek() -> Element?
}

struct Stack<Element>: StackProtocol {
    private let array = [Element]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    func push(_ element: Element) {
    
    }
    
    func pop() -> Element? {
        return nil
    }
    
    func peek() -> Element? {
        return nil
    }
}



class StackTests: XCTestCase {
    func test_init_deliversEmptyStack() {
        let sut = Stack<Int>()
        
        XCTAssertEqual(sut.isEmpty, true)
        XCTAssertEqual(sut.count, 0)
        XCTAssertEqual(sut.peek(), nil)
    }
}

StackTests.defaultTestSuite.run()


//Use cases

// Stack characteristics
    // 1. store number of elements
    // 2. Can be empty
    // 3. push(_:) must enter elements into the last position of stack
    // 4. pop() should remove last element of the stack and return it
    // 5. pop() should return nil if stack is empty
    // 6. peek() will return last element of stack
    // 7. peek() should return nil if no elements in the stack
    // 8. isEmpty will return whether stack is empty or not
    // 9. count will return number of elements in the stack


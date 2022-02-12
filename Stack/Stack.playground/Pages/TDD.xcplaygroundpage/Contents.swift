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
    private var array = [Element]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    func pop() -> Element? {
        return nil
    }
    
    func peek() -> Element? {
        return array.last
    }
}



class StackTests: XCTestCase {
    func test_init_deliversEmptyStack() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.isEmpty, true)
        XCTAssertEqual(sut.count, 0)
        XCTAssertEqual(sut.peek(), nil)
    }
    
    func test_push_insertsValueIntoStack() {
        var sut = makeSUT()
        
        sut.push(1)
        
        XCTAssertEqual(sut.isEmpty, false)
        XCTAssertEqual(sut.count, 1)
        XCTAssertEqual(sut.peek(), 1)
    }
    
    func test_push_insertsValuesIntoStack() {
        var sut = makeSUT()
        
        sut.push(1)
        sut.push(2)
        
        XCTAssertEqual(sut.isEmpty, false)
        XCTAssertEqual(sut.count, 2)
        XCTAssertEqual(sut.peek(), 2)
    }
    
    //MARK: - Helpers
    private func makeSUT() -> Stack<Int> {
        return Stack<Int>()
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


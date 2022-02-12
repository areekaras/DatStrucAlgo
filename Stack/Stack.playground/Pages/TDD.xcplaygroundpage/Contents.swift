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
        
        checkStackAssertions(sut, isEmpty: true, count: 0, expectedPeek: nil)
    }
    
    func test_push_insertsValueIntoStack() {
        var sut = makeSUT()
        
        sut.push(1)
        
        checkStackAssertions(sut, isEmpty: false, count: 1, expectedPeek: 2)
    }
    
    func test_push_insertsValuesIntoStack() {
        var sut = makeSUT()
        
        sut.push(1)
        sut.push(2)
        
        checkStackAssertions(sut, isEmpty: false, count: 2, expectedPeek: 2)
    }
    
    //MARK: - Helpers
    private func makeSUT() -> Stack<Int> {
        return Stack<Int>()
    }
    
    //file and line is not working in playgrond
    private func checkStackAssertions(_ sut: Stack<Int>, isEmpty: Bool, count: Int, expectedPeek: Int?, file: StaticString = #filePath, line: UInt = #line) {
        XCTAssertEqual(sut.isEmpty, isEmpty, file: file, line: line)
        XCTAssertEqual(sut.count, count, file: file, line: line)
        XCTAssertEqual(sut.peek(), expectedPeek, file: file, line: line)
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


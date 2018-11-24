//
//  StackTests.swift
//  DataStructures
//
//  Created by Rogelio Gudino on 3/22/15.
//  Copyright © 2017 Rogelio Gudino. All rights reserved.
//

import XCTest
import DataStructures_Stack_Stack

class StackTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCount() {
        let stack = Stack<Int>(elements: [1, 2, 3])
        XCTAssert(stack.count() == 3, "Count should be 3.")
    }
    
    func testPeek() {
        let stack = Stack<Int>(elements: [1, 2, 3])
        XCTAssert(stack.peek() == 3, "Peeked element should be 3.")
    }
    
    func testMutation() {
        var stack = Stack<Int>()
        stack.push(1)
        XCTAssert(stack.peek() == 1, "Peeked element should be 1.")
        stack.push(2)
        XCTAssert(stack.pop() == 2, "Next element should be 2.")
        XCTAssert(stack.pop() == 1, "Next element should be 1.")
    }
    
    func testReverse() {
        var stack = Stack<Int>()
        stack.reverse()
        XCTAssert(stack.count() == 0)
        XCTAssertNil(stack.peek())
        
        stack.push(1)
        stack.reverse()
        XCTAssert(stack.peek() == 1)
        
        stack.push(2)
        stack.push(3)
        stack.push(4)
        stack.reverse()
        XCTAssert(stack.pop() == 1)
        XCTAssert(stack.pop() == 2)
        XCTAssert(stack.pop() == 3)
        XCTAssert(stack.pop() == 4)
        XCTAssert(stack.count() == 0)
        
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(4)
        stack.reverse()
        XCTAssert(stack.pop() == 1)
        XCTAssert(stack.pop() == 2)
        XCTAssert(stack.pop() == 3)
        XCTAssert(stack.pop() == 4)
        XCTAssert(stack.count() == 0)
        
        stack.push(1)
        stack.push(2)
        stack.push(3)
        stack.push(4)
        stack.reverse()
        stack.reverse()
        XCTAssert(stack.pop() == 4)
        XCTAssert(stack.pop() == 3)
        XCTAssert(stack.pop() == 2)
        XCTAssert(stack.pop() == 1)
        XCTAssert(stack.count() == 0)
        
        stack.push(1)
        stack.push(2)
        stack.reverse()
        stack.push(3)
        stack.push(4)
        XCTAssert(stack.pop() == 4)
        XCTAssert(stack.pop() == 3)
        XCTAssert(stack.pop() == 1)
        XCTAssert(stack.pop() == 2)
        XCTAssert(stack.count() == 0)
    }
}

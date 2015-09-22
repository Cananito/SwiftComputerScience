//
//  StackTests.swift
//  StackTests
//
//  Created by Rogelio Gudino on 3/22/15.
//  Copyright (c) 2015 Rogelio Gudino. All rights reserved.
//

import XCTest
import DataStructures

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
}

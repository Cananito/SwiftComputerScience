//
//  LinkedListTests.swift
//  LinkedListTests
//
//  Created by Rogelio Gudino on 2/19/15.
//  Copyright (c) 2015 Rogelio Gudino. All rights reserved.
//

import LinkedList
import XCTest

class LinkedListTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEmptyLinkedListDescription() {
        let emptyLinkedList = LinkedList<Int>()
        XCTAssert(emptyLinkedList.firstNode == nil, "An empty list’s firstNode should nil")
        XCTAssert(emptyLinkedList.lastNode == nil, "An empty list’s lastNode should nil")
    }
    
    func testPrependingValues() {
        let linkedList = LinkedList<Int>()
        linkedList.prependValue(3)
        linkedList.prependValue(2)
        linkedList.prependValue(1)
        
        var node = linkedList.firstNode
        XCTAssert(node?.value == 1, "firstNode should be 1")
        
        node = node?.nextNode
        XCTAssert(node?.value == 2, "firstNode should be 2")
        
        node = node?.nextNode
        XCTAssert(node?.value == 3, "firstNode should be 3")
        
        XCTAssert(linkedList.lastNode?.value == 3, "lastNode should be 3")
    }
    
    func testAppendingValues() {
        let linkedList = LinkedList<Int>()
        linkedList.appendValue(3)
        linkedList.appendValue(2)
        linkedList.appendValue(1)
        
        var node = linkedList.firstNode
        XCTAssert(node?.value == 3, "firstNode should be 3")
        
        node = node?.nextNode
        XCTAssert(node?.value == 2, "firstNode should be 2")
        
        node = node?.nextNode
        XCTAssert(node?.value == 1, "firstNode should be 1")
        
        XCTAssert(linkedList.lastNode?.value == 1, "lastNode should be 1")
    }
    
    func testDetachingFirstValues() {
        let linkedList = LinkedList<Int>()
        linkedList.prependValue(3)
        linkedList.prependValue(2)
        linkedList.prependValue(1)
        
        XCTAssert(linkedList.detachFirstValue() == 1, "First detached value should be 1")
        XCTAssert(linkedList.detachFirstValue() == 2, "First detached value should be 2")
        XCTAssert(linkedList.detachFirstValue() == 3, "First detached value should be 3")
        print("\(linkedList.firstNode?.value)")
        XCTAssert(linkedList.detachFirstValue() == nil, "First detached value should be nil")
    }
    
    func testDetachingLastValues() {
        let linkedList = LinkedList<Int>()
        linkedList.appendValue(3)
        linkedList.appendValue(2)
        linkedList.appendValue(1)
        
        XCTAssert(linkedList.detachLastValue() == 1, "First detached value should be 1")
        XCTAssert(linkedList.detachLastValue() == 2, "First detached value should be 2")
        XCTAssert(linkedList.detachLastValue() == 3, "First detached value should be 3")
        print("\(linkedList.lastNode?.value)")
        XCTAssert(linkedList.detachLastValue() == nil, "First detached value should be nil")
    }
}

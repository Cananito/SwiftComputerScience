//
//  ArrayDequeTests.swift
//  DataStructures
//
//  Created by Rogelio Gudino on 7/9/15.
//  Copyright © 2017 Rogelio Gudino. All rights reserved.
//

import XCTest
import DataStructures

class ArrayDequeTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAddAndRemoveElements() {
        var arrayDeque = ArrayDeque<Int>()
        XCTAssert(arrayDeque.count() == 0)
        
        arrayDeque.append(1)
        XCTAssert(arrayDeque.count() == 1)
        
        arrayDeque.append(2)
        XCTAssert(arrayDeque.count() == 2)
        
        arrayDeque.prepend(0)
        XCTAssert(arrayDeque.count() == 3)
        
        XCTAssert(arrayDeque[0] != .None)
        XCTAssert(arrayDeque[1] != .None)
        XCTAssert(arrayDeque[2] != .None)
        XCTAssert(arrayDeque[0]! == 0)
        XCTAssert(arrayDeque[1]! == 1)
        XCTAssert(arrayDeque[2]! == 2)
        
        XCTAssert(arrayDeque.removeFirst()! == 0)
        XCTAssert(arrayDeque.count() == 2)
        
        XCTAssert(arrayDeque.removeLast()! == 2)
        XCTAssert(arrayDeque.count() == 1)
    }
    
    func testInitializeWithArray() {
        let arrayDeque = ArrayDeque<Int>(array: [1, 2, 3])
        XCTAssert(arrayDeque.count() == 3)
        
        XCTAssert(arrayDeque[0] != .None)
        XCTAssert(arrayDeque[1] != .None)
        XCTAssert(arrayDeque[2] != .None)
        XCTAssert(arrayDeque[0]! == 1)
        XCTAssert(arrayDeque[1]! == 2)
        XCTAssert(arrayDeque[2]! == 3)
    }
    
    func testCircularPrepending() {
        var arrayDeque = ArrayDeque<Int>()
        
        arrayDeque.prepend(0)
        XCTAssert(arrayDeque.count() == 1)
        XCTAssert(arrayDeque[0] != .None)
        XCTAssert(arrayDeque[0]! == 0)
        
        arrayDeque.prepend(1)
        XCTAssert(arrayDeque.count() == 2)
        XCTAssert(arrayDeque[0] != .None)
        XCTAssert(arrayDeque[0]! == 1)
        
        arrayDeque.prepend(2)
        XCTAssert(arrayDeque.count() == 3)
        XCTAssert(arrayDeque[0] != .None)
        XCTAssert(arrayDeque[0]! == 2)
        
        arrayDeque.prepend(3)
        XCTAssert(arrayDeque.count() == 4)
        XCTAssert(arrayDeque[0] != .None)
        XCTAssert(arrayDeque[0]! == 3)
        
        arrayDeque.prepend(4)
        XCTAssert(arrayDeque.count() == 5)
        XCTAssert(arrayDeque[0] != .None)
        XCTAssert(arrayDeque[0]! == 4)
    }
    
    func testCopy() {
        var first = ArrayDeque<Int>()
        first.append(0)
        first.append(1)
        
        var second = first
        XCTAssert(second.count() == 2)
        
        second.removeLast()
        XCTAssert(first.count() == 2)
        XCTAssert(second.count() == 1)
        XCTAssert(second[0] != .None)
        XCTAssert(second[0] == 0)
    }
    
    func testDoublePrependAndRemoveLast() {
        var arrayDeque = ArrayDeque<Int>()
        arrayDeque.prepend(2)
        arrayDeque.prepend(1)
        
        var element = arrayDeque.removeLast()
        XCTAssert(element != .None)
        XCTAssert(element! == 2)
        
        element = arrayDeque.removeLast()
        XCTAssert(element != .None)
        XCTAssert(element! == 1)
        
        element = arrayDeque.removeLast()
        XCTAssert(element == .None)
    }
    
    func testDoublePrependAndRemoveFirst() {
        var arrayDeque = ArrayDeque<Int>()
        arrayDeque.prepend(2)
        arrayDeque.prepend(1)
        
        var element = arrayDeque.removeFirst()
        XCTAssert(element != .None)
        XCTAssert(element! == 1)
        
        element = arrayDeque.removeFirst()
        XCTAssert(element != .None)
        XCTAssert(element! == 2)
        
        element = arrayDeque.removeFirst()
        XCTAssert(element == .None)
    }
    
    func testDoubleAppendAndRemoveFirst() {
        var arrayDeque = ArrayDeque<Int>()
        arrayDeque.append(1)
        arrayDeque.append(2)
        
        var element = arrayDeque.removeFirst()
        XCTAssert(element != .None)
        XCTAssert(element! == 1)
        
        element = arrayDeque.removeFirst()
        XCTAssert(element != .None)
        XCTAssert(element! == 2)
        
        element = arrayDeque.removeFirst()
        XCTAssert(element == .None)
    }
    
    func testDoubleAppendAndRemoveLast() {
        var arrayDeque = ArrayDeque<Int>()
        arrayDeque.append(1)
        arrayDeque.append(2)
        
        var element = arrayDeque.removeLast()
        XCTAssert(element != .None)
        XCTAssert(element! == 2)
        
        element = arrayDeque.removeLast()
        XCTAssert(element != .None)
        XCTAssert(element! == 1)
        
        element = arrayDeque.removeLast()
        XCTAssert(element == .None)
    }
}

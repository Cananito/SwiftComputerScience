//
//  ArrayDequeTests.swift
//  ArrayDequeTests
//
//  Created by Rogelio Gudino on 7/9/15.
//  Copyright © 2015 Rogelio Gudino. All rights reserved.
//

import ArrayDeque
import XCTest

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
        
        arrayDeque.appendElement(1)
        XCTAssert(arrayDeque.count() == 1)
        
        arrayDeque.appendElement(2)
        XCTAssert(arrayDeque.count() == 2)
        
        arrayDeque.prependElement(0)
        XCTAssert(arrayDeque.count() == 3)
        
        XCTAssert(arrayDeque[0] != .None)
        XCTAssert(arrayDeque[1] != .None)
        XCTAssert(arrayDeque[2] != .None)
        XCTAssert(arrayDeque[0]! == 0)
        XCTAssert(arrayDeque[1]! == 1)
        XCTAssert(arrayDeque[2]! == 2)
        
        XCTAssert(arrayDeque.removeFirstElement()! == 0)
        XCTAssert(arrayDeque.count() == 2)
        
        XCTAssert(arrayDeque.removeLastElement()! == 2)
        XCTAssert(arrayDeque.count() == 1)
    }
    
    func testInitializeWithArray() {
        var arrayDeque = ArrayDeque<Int>(array: [1, 2, 3])
        XCTAssert(arrayDeque.count() == 3)
        
        XCTAssert(arrayDeque[0] != .None)
        XCTAssert(arrayDeque[1] != .None)
        XCTAssert(arrayDeque[2] != .None)
        XCTAssert(arrayDeque[0]! == 1)
        XCTAssert(arrayDeque[1]! == 2)
        XCTAssert(arrayDeque[2]! == 3)
    }
}

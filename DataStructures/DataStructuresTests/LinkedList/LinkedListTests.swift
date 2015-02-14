//
//  LinkedListTests.swift
//  DataStructures
//
//  Created by Rogelio Gudino on 2/13/15.
//
//

import XCTest
#if os(iOS)
    import DataStructuresiOS
#else
    import DataStructuresOSX
#endif

class DataStructuresOSXTests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEmptyLinkedListDescription() {
        let emptyLinkedList = LinkedList<Int>()
        XCTAssert(emptyLinkedList.description == "", "An empty list should have empty description")
    }
    
    func testPrependingValues() {
        let linkedList = LinkedList<Int>()
        linkedList.prependValue(3)
        linkedList.prependValue(2)
        linkedList.prependValue(1)
        XCTAssert(linkedList.description == "1 -> 2 -> 3", "List with 3 prepended values should print them in reverse order")
    }
}

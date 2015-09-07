//
//  BinaryTreeTests.swift
//  BinaryTreeTests
//
//  Created by Rogelio Gudino on 9/6/15.
//  Copyright © 2015 Rogelio Gudino. All rights reserved.
//

import XCTest
import BinaryTree

class BinaryTreeTests: XCTestCase {
    func testNextNode() {
        let node2 = BinaryTreeNode<Int>(value: 2)
        let node1 = BinaryTreeNode<Int>(value: 1)
        let node3 = BinaryTreeNode<Int>(value: 3)
        let node4 = BinaryTreeNode<Int>(value: 4)
        let node5 = BinaryTreeNode<Int>(value: 5)
        let node6 = BinaryTreeNode<Int>(value: 6)
        let node7 = BinaryTreeNode<Int>(value: 7)
        let node8 = BinaryTreeNode<Int>(value: 8)
        let node9 = BinaryTreeNode<Int>(value: 9)
        let node10 = BinaryTreeNode<Int>(value: 10)
        let node11 = BinaryTreeNode<Int>(value: 11)
        let node12 = BinaryTreeNode<Int>(value: 12)
        let node13 = BinaryTreeNode<Int>(value: 13)
        let node14 = BinaryTreeNode<Int>(value: 14)
        let node15 = BinaryTreeNode<Int>(value: 15)
        let node16 = BinaryTreeNode<Int>(value: 16)
        let node17 = BinaryTreeNode<Int>(value: 17)
        let node18 = BinaryTreeNode<Int>(value: 18)
        let node19 = BinaryTreeNode<Int>(value: 19)
        let node20 = BinaryTreeNode<Int>(value: 20)
        let node21 = BinaryTreeNode<Int>(value: 21)
        
        node2.leftNode = node1
        node1.parentNode = node2
        
        node3.leftNode = node2
        node2.parentNode = node3
        
        node16.leftNode = node3
        node3.parentNode = node16
        
        node5.leftNode = node4
        node4.parentNode = node5
        
        node7.leftNode = node5
        node5.parentNode = node7
        
        node5.rightNode = node6
        node6.parentNode = node5
        
        node12.leftNode = node7
        node7.parentNode = node12
        
        node7.rightNode = node8
        node8.parentNode = node7
        
        node10.leftNode = node9
        node9.parentNode = node10
        
        node8.rightNode = node10
        node10.parentNode = node8
        
        node10.rightNode = node11
        node11.parentNode = node10
        
        node3.rightNode = node12
        node12.parentNode = node3
        
        node14.leftNode = node13
        node13.parentNode = node14
        
        node12.rightNode = node14
        node14.parentNode = node12
        
        node14.rightNode = node15
        node15.parentNode = node14
        
        node16.parentNode = nil
        
        node16.rightNode = node17
        node17.parentNode = node16
        
        node19.leftNode = node18
        node18.parentNode = node19
        
        node17.rightNode = node19
        node19.parentNode = node17
        
        node19.rightNode = node20
        node20.parentNode = node19
        
        node20.rightNode = node21
        node21.parentNode = node20
        
        XCTAssert(node1.next() === node2)
        XCTAssert(node2.next() === node3)
        XCTAssert(node3.next() === node4)
        XCTAssert(node4.next() === node5)
        XCTAssert(node5.next() === node6)
        XCTAssert(node6.next() === node7)
        XCTAssert(node7.next() === node8)
        XCTAssert(node8.next() === node9)
        XCTAssert(node9.next() === node10)
        XCTAssert(node10.next() === node11)
        XCTAssert(node11.next() === node12)
        XCTAssert(node12.next() === node13)
        XCTAssert(node13.next() === node14)
        XCTAssert(node14.next() === node15)
        XCTAssert(node15.next() === node16)
        XCTAssert(node16.next() === node17)
        XCTAssert(node17.next() === node18)
        XCTAssert(node18.next() === node19)
        XCTAssert(node19.next() === node20)
        XCTAssert(node20.next() === node21)
    }
}

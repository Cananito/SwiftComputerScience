import XCTest
import DataStructures_BinaryTree_BinaryTree

class BinaryTreeTests: XCTestCase {
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
    let node16 = BinaryTreeNode<Int>(value: 16) // Root node
    let node17 = BinaryTreeNode<Int>(value: 17)
    let node18 = BinaryTreeNode<Int>(value: 18)
    let node19 = BinaryTreeNode<Int>(value: 19)
    let node20 = BinaryTreeNode<Int>(value: 20)
    let node21 = BinaryTreeNode<Int>(value: 21)

    override func setUp() {
        self.node2.leftNode = self.node1
        self.node1.parentNode = self.node2

        self.node3.leftNode = self.node2
        self.node2.parentNode = self.node3

        self.node16.leftNode = self.node3
        self.node3.parentNode = self.node16

        self.node5.leftNode = self.node4
        self.node4.parentNode = self.node5

        self.node7.leftNode = self.node5
        self.node5.parentNode = self.node7

        self.node5.rightNode = self.node6
        self.node6.parentNode = self.node5

        self.node12.leftNode = self.node7
        self.node7.parentNode = self.node12

        self.node7.rightNode = self.node8
        self.node8.parentNode = self.node7

        self.node10.leftNode = self.node9
        self.node9.parentNode = self.node10

        self.node8.rightNode = self.node10
        self.node10.parentNode = self.node8

        self.node10.rightNode = self.node11
        self.node11.parentNode = self.node10

        self.node3.rightNode = self.node12
        self.node12.parentNode = self.node3

        self.node14.leftNode = self.node13
        self.node13.parentNode = self.node14

        self.node12.rightNode = self.node14
        self.node14.parentNode = self.node12

        self.node14.rightNode = self.node15
        self.node15.parentNode = self.node14

        self.node16.rightNode = self.node17
        self.node17.parentNode = self.node16

        self.node19.leftNode = self.node18
        self.node18.parentNode = self.node19

        self.node17.rightNode = self.node19
        self.node19.parentNode = self.node17

        self.node19.rightNode = self.node20
        self.node20.parentNode = self.node19

        self.node20.rightNode = self.node21
        self.node21.parentNode = self.node20
    }

    func testEnumerateInOrder() {
        var array = [BinaryTreeNode<Int>]()
        self.node16.enumerateInOrder { (node) -> () in
            array.append(node)
        }
        XCTAssert(array.description == "[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21]")
    }

    func testEnumeratePreOrder() {
        var array = [BinaryTreeNode<Int>]()
        self.node16.enumeratePreOrder { (node) -> () in
            array.append(node)
        }
        XCTAssert(array.description == "[16, 3, 2, 1, 12, 7, 5, 4, 6, 8, 10, 9, 11, 14, 13, 15, 17, 19, 18, 20, 21]")
    }

    func testEnumeratePostOrder() {
        var array = [BinaryTreeNode<Int>]()
        self.node16.enumeratePostOrder { (node) -> () in
            array.append(node)
        }
        XCTAssert(array.description == "[1, 2, 4, 6, 5, 9, 11, 10, 8, 7, 13, 15, 14, 12, 3, 18, 21, 20, 19, 17, 16]")
    }

    func testEnumerateBreadthFirst() {
        var array = [BinaryTreeNode<Int>]()
        self.node16.enumerateBreadthFirst { (node) -> () in
            array.append(node)
        }
        XCTAssert(array.description == "[16, 3, 17, 2, 12, 19, 1, 7, 14, 18, 20, 5, 8, 13, 15, 21, 4, 6, 10, 9, 11]")
    }

    func testNextNode() {
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

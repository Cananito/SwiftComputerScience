import XCTest
import DataStructures_ArrayDeque_ArrayDeque

class ArrayDequeTests: XCTestCase {
  func testAddAndRemoveElements() {
    var arrayDeque = ArrayDeque<Int>()
    XCTAssert(arrayDeque.count() == 0)

    arrayDeque.append(1)
    XCTAssert(arrayDeque.count() == 1)

    arrayDeque.append(2)
    XCTAssert(arrayDeque.count() == 2)

    arrayDeque.prepend(0)
    XCTAssert(arrayDeque.count() == 3)

    XCTAssert(arrayDeque[0] != .none)
    XCTAssert(arrayDeque[1] != .none)
    XCTAssert(arrayDeque[2] != .none)
    XCTAssert(arrayDeque[0]! == 0)
    XCTAssert(arrayDeque[1]! == 1)
    XCTAssert(arrayDeque[2]! == 2)

    XCTAssert(arrayDeque.removeFirst()! == 0)
    XCTAssert(arrayDeque.count() == 2)

    XCTAssert(arrayDeque.removeLast()! == 2)
    XCTAssert(arrayDeque.count() == 1)
  }

  func testCapacityChangesAndLast() {
    var arrayDeque = ArrayDeque<Int>()
    XCTAssertEqual(arrayDeque.count(), 0)
    XCTAssertNil(arrayDeque.last())

    // Append.
    arrayDeque.append(1)
    XCTAssertEqual(arrayDeque.count(), 1)
    XCTAssertEqual(arrayDeque.last(), 1)

    arrayDeque.append(2)
    XCTAssertEqual(arrayDeque.count(), 2)
    XCTAssertEqual(arrayDeque.last(), 2)

    arrayDeque.append(3)
    XCTAssertEqual(arrayDeque.count(), 3)
    XCTAssertEqual(arrayDeque.last(), 3)

    arrayDeque.append(4)
    XCTAssertEqual(arrayDeque.count(), 4)
    XCTAssertEqual(arrayDeque.last(), 4)

    arrayDeque.append(5)
    XCTAssertEqual(arrayDeque.count(), 5)
    XCTAssertEqual(arrayDeque.last(), 5)

    arrayDeque.append(6)
    XCTAssertEqual(arrayDeque.count(), 6)
    XCTAssertEqual(arrayDeque.last(), 6)

    arrayDeque.append(7)
    XCTAssertEqual(arrayDeque.count(), 7)
    XCTAssertEqual(arrayDeque.last(), 7)

    arrayDeque.append(8)
    XCTAssertEqual(arrayDeque.count(), 8)
    XCTAssertEqual(arrayDeque.last(), 8)

    arrayDeque.append(9)
    XCTAssertEqual(arrayDeque.count(), 9)
    XCTAssertEqual(arrayDeque.last(), 9)

    // Pop.
    XCTAssertEqual(arrayDeque.removeLast(), 9)
    XCTAssertEqual(arrayDeque.last(), 8)

    XCTAssertEqual(arrayDeque.removeLast(), 8)
    XCTAssertEqual(arrayDeque.last(), 7)

    XCTAssertEqual(arrayDeque.removeLast(), 7)
    XCTAssertEqual(arrayDeque.last(), 6)

    XCTAssertEqual(arrayDeque.removeLast(), 6)
    XCTAssertEqual(arrayDeque.last(), 5)

    XCTAssertEqual(arrayDeque.removeLast(), 5)
    XCTAssertEqual(arrayDeque.last(), 4)

    XCTAssertEqual(arrayDeque.removeLast(), 4)
    XCTAssertEqual(arrayDeque.last(), 3)

    XCTAssertEqual(arrayDeque.removeLast(), 3)
    XCTAssertEqual(arrayDeque.last(), 2)

    XCTAssertEqual(arrayDeque.removeLast(), 2)
    XCTAssertEqual(arrayDeque.last(), 1)

    XCTAssertEqual(arrayDeque.removeLast(), 1)
    XCTAssertNil(arrayDeque.last())
  }

  func testInitializeWithArray() {
    let arrayDeque = ArrayDeque<Int>(array: [1, 2, 3])
    XCTAssert(arrayDeque.count() == 3)

    XCTAssert(arrayDeque[0] != .none)
    XCTAssert(arrayDeque[1] != .none)
    XCTAssert(arrayDeque[2] != .none)
    XCTAssert(arrayDeque[0]! == 1)
    XCTAssert(arrayDeque[1]! == 2)
    XCTAssert(arrayDeque[2]! == 3)
  }

  func testCircularPrepending() {
    var arrayDeque = ArrayDeque<Int>()

    arrayDeque.prepend(0)
    XCTAssert(arrayDeque.count() == 1)
    XCTAssert(arrayDeque[0] != .none)
    XCTAssert(arrayDeque[0]! == 0)

    arrayDeque.prepend(1)
    XCTAssert(arrayDeque.count() == 2)
    XCTAssert(arrayDeque[0] != .none)
    XCTAssert(arrayDeque[0]! == 1)

    arrayDeque.prepend(2)
    XCTAssert(arrayDeque.count() == 3)
    XCTAssert(arrayDeque[0] != .none)
    XCTAssert(arrayDeque[0]! == 2)

    arrayDeque.prepend(3)
    XCTAssert(arrayDeque.count() == 4)
    XCTAssert(arrayDeque[0] != .none)
    XCTAssert(arrayDeque[0]! == 3)

    arrayDeque.prepend(4)
    XCTAssert(arrayDeque.count() == 5)
    XCTAssert(arrayDeque[0] != .none)
    XCTAssert(arrayDeque[0]! == 4)
  }

  func testCopy() {
    var first = ArrayDeque<Int>()
    first.append(0)
    first.append(1)

    var second = first
    XCTAssert(second.count() == 2)

    _ = second.removeLast()
    XCTAssert(first.count() == 2)
    XCTAssert(second.count() == 1)
    XCTAssert(second[0] != .none)
    XCTAssert(second[0] == 0)
  }

  func testDoublePrependAndRemoveLast() {
    var arrayDeque = ArrayDeque<Int>()
    arrayDeque.prepend(2)
    arrayDeque.prepend(1)

    var element = arrayDeque.removeLast()
    XCTAssert(element != .none)
    XCTAssert(element! == 2)

    element = arrayDeque.removeLast()
    XCTAssert(element != .none)
    XCTAssert(element! == 1)

    element = arrayDeque.removeLast()
    XCTAssert(element == .none)
  }

  func testDoublePrependAndRemoveFirst() {
    var arrayDeque = ArrayDeque<Int>()
    arrayDeque.prepend(2)
    arrayDeque.prepend(1)

    var element = arrayDeque.removeFirst()
    XCTAssert(element != .none)
    XCTAssert(element! == 1)

    element = arrayDeque.removeFirst()
    XCTAssert(element != .none)
    XCTAssert(element! == 2)

    element = arrayDeque.removeFirst()
    XCTAssert(element == .none)
  }

  func testDoubleAppendAndRemoveFirst() {
    var arrayDeque = ArrayDeque<Int>()
    arrayDeque.append(1)
    arrayDeque.append(2)

    var element = arrayDeque.removeFirst()
    XCTAssert(element != .none)
    XCTAssert(element! == 1)

    element = arrayDeque.removeFirst()
    XCTAssert(element != .none)
    XCTAssert(element! == 2)

    element = arrayDeque.removeFirst()
    XCTAssert(element == .none)
  }

  func testDoubleAppendAndRemoveLast() {
    var arrayDeque = ArrayDeque<Int>()
    arrayDeque.append(1)
    arrayDeque.append(2)

    var element = arrayDeque.removeLast()
    XCTAssert(element != .none)
    XCTAssert(element! == 2)

    element = arrayDeque.removeLast()
    XCTAssert(element != .none)
    XCTAssert(element! == 1)

    element = arrayDeque.removeLast()
    XCTAssert(element == .none)
  }
}

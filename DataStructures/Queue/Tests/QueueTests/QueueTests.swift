import XCTest
import Queue

class QueueTests: XCTestCase {
  func testCount() {
    let queue = Queue<Int>(elements: [1, 2, 3])
    XCTAssert(queue.count() == 3, "Count should be 3.")
  }

  func testPeek() {
    let queue = Queue<Int>(elements: [1, 2, 3])
    XCTAssert(queue.peek() == 1, "Peeked element should be 1.")
  }

  func testMutation() {
    var queue = Queue<Int>()
    queue.add(1)
    XCTAssert(queue.peek() == 1, "Peeked element should be 1.")
    queue.add(2)
    XCTAssert(queue.next() == 1, "Next element should be 1.")
    XCTAssert(queue.next() == 2, "Next element should be 2.")
  }

  static var allTests = [
    ("testCount", testCount),
    ("testPeek", testPeek),
    ("testMutation", testMutation),
  ]
}

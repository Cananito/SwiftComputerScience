import XCTest
import Stack
import RecursiveReverseStack

class RecursiveReverseStackTests: XCTestCase {
  func testRecursiveReverseStack() {
    var stack = Stack<Int>()
    Stack.reverseStack(&stack)
    XCTAssertEqual(stack.count(), 0)

    stack.push(1)
    Stack.reverseStack(&stack)
    XCTAssertEqual(stack.peek()!, 1)

    stack.push(2)
    stack.push(3)
    Stack.reverseStack(&stack)
    XCTAssertEqual(stack.pop(), 1)
    XCTAssertEqual(stack.pop(), 2)
    XCTAssertEqual(stack.pop(), 3)
    XCTAssertEqual(stack.count(), 0)
  }

  func testRecursiveReverseStackPerformance() {
    var stack = Stack<Int>()
    for i in 1...1000 {
      stack.push(i)
    }

    self.measure {
      Stack.reverseStack(&stack)
    }
  }

  func testFlagFlipReverseStackPerformance() {
    var stack = Stack<Int>()
    for i in 1...1000 {
      stack.push(i)
    }

    self.measure {
      stack.reverse()
    }
  }

  static var allTests = [
    ("testRecursiveReverseStack", testRecursiveReverseStack),
    ("testRecursiveReverseStackPerformance", testRecursiveReverseStackPerformance),
    ("testFlagFlipReverseStackPerformance", testFlagFlipReverseStackPerformance),
  ]
}

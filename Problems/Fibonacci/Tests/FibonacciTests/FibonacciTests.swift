import XCTest
import Fibonacci

// 92 is the max position that doesn’t crash on 64-bit.
let meassurePosition = 92

class FibonacciTests: XCTestCase {
  func testIterativeFibonacci() {
    XCTAssertEqual(iterativeFibonacci(position: 0), 0)
    XCTAssertEqual(iterativeFibonacci(position: 1), 1)
    XCTAssertEqual(iterativeFibonacci(position: 2), 1)
    XCTAssertEqual(iterativeFibonacci(position: 3), 2)
    XCTAssertEqual(iterativeFibonacci(position: 4), 3)
    XCTAssertEqual(iterativeFibonacci(position: 5), 5)
    XCTAssertEqual(iterativeFibonacci(position: 6), 8)
    XCTAssertEqual(iterativeFibonacci(position: 7), 13)
    XCTAssertEqual(iterativeFibonacci(position: 8), 21)
    XCTAssertEqual(iterativeFibonacci(position: 9), 34)
  }

  func testRecursiveFibonacci() {
    XCTAssertEqual(recursiveFibonacci(position: 0), 0)
    XCTAssertEqual(recursiveFibonacci(position: 1), 1)
    XCTAssertEqual(recursiveFibonacci(position: 2), 1)
    XCTAssertEqual(recursiveFibonacci(position: 3), 2)
    XCTAssertEqual(recursiveFibonacci(position: 4), 3)
    XCTAssertEqual(recursiveFibonacci(position: 5), 5)
    XCTAssertEqual(recursiveFibonacci(position: 6), 8)
    XCTAssertEqual(recursiveFibonacci(position: 7), 13)
    XCTAssertEqual(recursiveFibonacci(position: 8), 21)
    XCTAssertEqual(recursiveFibonacci(position: 9), 34)
  }

  func testMemoizedRecursiveFibonacci() {
    var memoization = [Int : Int]()
    XCTAssertEqual(memoizedRecursiveFibonacci(position: 0, memoization: &memoization), 0)
    XCTAssertEqual(memoizedRecursiveFibonacci(position: 1, memoization: &memoization), 1)
    XCTAssertEqual(memoizedRecursiveFibonacci(position: 2, memoization: &memoization), 1)
    XCTAssertEqual(memoizedRecursiveFibonacci(position: 3, memoization: &memoization), 2)
    XCTAssertEqual(memoizedRecursiveFibonacci(position: 4, memoization: &memoization), 3)
    XCTAssertEqual(memoizedRecursiveFibonacci(position: 5, memoization: &memoization), 5)
    XCTAssertEqual(memoizedRecursiveFibonacci(position: 6, memoization: &memoization), 8)
    XCTAssertEqual(memoizedRecursiveFibonacci(position: 7, memoization: &memoization), 13)
    XCTAssertEqual(memoizedRecursiveFibonacci(position: 8, memoization: &memoization), 21)
    XCTAssertEqual(memoizedRecursiveFibonacci(position: 9, memoization: &memoization), 34)
  }

  func testIterativeFibonacciPerformance() {
    // Time: 0.000 sec (25% STDEV)
    self.measure {
      let _ = iterativeFibonacci(position: meassurePosition)
      let _ = iterativeFibonacci(position: meassurePosition)
      let _ = iterativeFibonacci(position: meassurePosition)
      let _ = iterativeFibonacci(position: meassurePosition)
      let _ = iterativeFibonacci(position: meassurePosition)
    }
  }

  func testRecursiveFibonacciPerformance() {
    // Time: 0.011 sec (5% STDEV) (with `position: 30`)
    // Time: 0.119 sec (2% STDEV) (with `position: 35`)
    self.measure {
      // Takes extremely long if meassured with `meassurePosition`.
      let _ = recursiveFibonacci(position: 30)
    }
  }

  func testPopulatedMemoizedRecursiveFibonacciPerformance() {
    var memoization = [Int : Int]()
    let _ = memoizedRecursiveFibonacci(position: meassurePosition, memoization: &memoization)
    // Time: 0.000 sec (88% STDEV)
    self.measure {
      let _ = memoizedRecursiveFibonacci(position: meassurePosition, memoization: &memoization)
      let _ = memoizedRecursiveFibonacci(position: meassurePosition, memoization: &memoization)
      let _ = memoizedRecursiveFibonacci(position: meassurePosition, memoization: &memoization)
      let _ = memoizedRecursiveFibonacci(position: meassurePosition, memoization: &memoization)
      let _ = memoizedRecursiveFibonacci(position: meassurePosition, memoization: &memoization)
    }
  }

  func testEmptyMemoizedRecursiveFibonacciPerformance() {
    var firstMemoization = [Int : Int]()
    var secondMemoization = [Int : Int]()
    var thirdMemoization = [Int : Int]()
    var fourthMemoization = [Int : Int]()
    var fifthMemoization = [Int : Int]()
    // Time: 0.000 sec (299% STDEV)
    self.measure {
      let _ = memoizedRecursiveFibonacci(position: meassurePosition, memoization: &firstMemoization)
      let _ = memoizedRecursiveFibonacci(position: meassurePosition, memoization: &secondMemoization)
      let _ = memoizedRecursiveFibonacci(position: meassurePosition, memoization: &thirdMemoization)
      let _ = memoizedRecursiveFibonacci(position: meassurePosition, memoization: &fourthMemoization)
      let _ = memoizedRecursiveFibonacci(position: meassurePosition, memoization: &fifthMemoization)
    }
  }

  static var allTests = [
    ("testIterativeFibonacci", testIterativeFibonacci),
    ("testRecursiveFibonacci", testRecursiveFibonacci),
    ("testMemoizedRecursiveFibonacci", testMemoizedRecursiveFibonacci),
    ("testIterativeFibonacciPerformance", testIterativeFibonacciPerformance),
    ("testRecursiveFibonacciPerformance", testRecursiveFibonacciPerformance),
    ("testPopulatedMemoizedRecursiveFibonacciPerformance", testPopulatedMemoizedRecursiveFibonacciPerformance),
    ("testEmptyMemoizedRecursiveFibonacciPerformance", testEmptyMemoizedRecursiveFibonacciPerformance),
  ]
}

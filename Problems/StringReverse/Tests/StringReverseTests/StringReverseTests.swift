import XCTest
import StringReverse

class StringReverseTests: XCTestCase {
  func testReversedViaStackIteration() {
    XCTAssertEqual("".reversedViaStackIteration(), "")
    XCTAssertEqual("Rogelio".reversedViaStackIteration(), "oilegoR")
  }

  func testReversedViaArrayIteration() {
    XCTAssertEqual("".reversedViaArrayIteration(), "")
    XCTAssertEqual("Rogelio".reversedViaArrayIteration(), "oilegoR")
  }

  func testReversedViaArrayTwoSideBuildup() {
    XCTAssertEqual("".reversedViaArrayTwoSideBuildup(), "")
    XCTAssertEqual("Rogelio".reversedViaArrayTwoSideBuildup(), "oilegoR")
  }

  static var allTests = [
    ("testReversedViaStackIteration", testReversedViaStackIteration),
    ("testReversedViaArrayIteration", testReversedViaArrayIteration),
    ("testReversedViaArrayTwoSideBuildup", testReversedViaArrayTwoSideBuildup),
  ]
}

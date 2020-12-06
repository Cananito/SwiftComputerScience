import XCTest
import Problems_AckermannFunction_AckermannFunction

class AckermannFunctionTests: XCTestCase {
  func testAckermannFunction() {
    XCTAssertEqual(ackermann(0, 0), 1)
    XCTAssertEqual(ackermann(0, 1), 2)
    XCTAssertEqual(ackermann(0, 2), 3)
    XCTAssertEqual(ackermann(0, 3), 4)
    XCTAssertEqual(ackermann(0, 4), 5)
    XCTAssertEqual(ackermann(0, 5), 6)

    XCTAssertEqual(ackermann(1, 0), 2)
    XCTAssertEqual(ackermann(1, 1), 3)
    XCTAssertEqual(ackermann(1, 2), 4)
    XCTAssertEqual(ackermann(1, 3), 5)
    XCTAssertEqual(ackermann(1, 4), 6)
    XCTAssertEqual(ackermann(1, 5), 7)

    XCTAssertEqual(ackermann(2, 0), 3)
    XCTAssertEqual(ackermann(2, 1), 5)
    XCTAssertEqual(ackermann(2, 2), 7)
    XCTAssertEqual(ackermann(2, 3), 9)
    XCTAssertEqual(ackermann(2, 4), 11)
    XCTAssertEqual(ackermann(2, 5), 13)

    XCTAssertEqual(ackermann(3, 0), 5)
    XCTAssertEqual(ackermann(3, 1), 13)
    XCTAssertEqual(ackermann(3, 2), 29)
    XCTAssertEqual(ackermann(3, 3), 61)
    XCTAssertEqual(ackermann(3, 4), 125)
    XCTAssertEqual(ackermann(3, 5), 253)

    XCTAssertEqual(ackermann(4, 0), 13)
    // ackermann(4, 1) segfaults!
  }
}

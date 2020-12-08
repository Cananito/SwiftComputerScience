import XCTest
import BinarySearch

class BinarySearchTests: XCTestCase {
  func testBinarySearch() {
    let array = [ 1, 3, 4, 7, 8, 10, 11, 30 ]
    XCTAssertEqual(array.binarySearch(1), 0)
    XCTAssertNil(array.binarySearch(2))
    XCTAssertEqual(array.binarySearch(3), 1)
    XCTAssertEqual(array.binarySearch(4), 2)
    XCTAssertNil(array.binarySearch(5))
    XCTAssertEqual(array.binarySearch(7), 3)
    XCTAssertEqual(array.binarySearch(8), 4)
    XCTAssertEqual(array.binarySearch(10), 5)
    XCTAssertEqual(array.binarySearch(11), 6)
    XCTAssertEqual(array.binarySearch(30), 7)
  }

  static var allTests = [
    ("testBinarySearch", testBinarySearch),
  ]
}

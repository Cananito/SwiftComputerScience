import XCTest
import RunLengthEncoding

final class RunLengthEncodingTests: XCTestCase {
  func testRLEGenerator() {
    do {
      var rleGenerator = try RLEGenerator(rle: [0, 5, 1, 1, 2, 2, 3, 3, 4, 4, 0, 4, 5, 5, 0, 2, 0, 4])
      XCTAssert(rleGenerator.isAtEnd() == false)
      XCTAssert(rleGenerator.next() == 1)

      XCTAssert(rleGenerator.isAtEnd() == false)
      XCTAssert(rleGenerator.next() == 2)
      XCTAssert(rleGenerator.isAtEnd() == false)
      XCTAssert(rleGenerator.next() == 2)

      XCTAssert(rleGenerator.isAtEnd() == false)
      XCTAssert(rleGenerator.next() == 3)
      XCTAssert(rleGenerator.isAtEnd() == false)
      XCTAssert(rleGenerator.next() == 3)
      XCTAssert(rleGenerator.isAtEnd() == false)
      XCTAssert(rleGenerator.next() == 3)

      XCTAssert(rleGenerator.isAtEnd() == false)
      XCTAssert(rleGenerator.next() == 4)
      XCTAssert(rleGenerator.isAtEnd() == false)
      XCTAssert(rleGenerator.next() == 4)
      XCTAssert(rleGenerator.isAtEnd() == false)
      XCTAssert(rleGenerator.next() == 4)
      XCTAssert(rleGenerator.isAtEnd() == false)
      XCTAssert(rleGenerator.next() == 4)

      XCTAssert(rleGenerator.isAtEnd() == false)
      XCTAssert(rleGenerator.next() == 5)
      XCTAssert(rleGenerator.isAtEnd() == false)
      XCTAssert(rleGenerator.next() == 5)
      XCTAssert(rleGenerator.isAtEnd() == false)
      XCTAssert(rleGenerator.next() == 5)
      XCTAssert(rleGenerator.isAtEnd() == false)
      XCTAssert(rleGenerator.next() == 5)
      XCTAssert(rleGenerator.isAtEnd() == false)
      XCTAssert(rleGenerator.next() == 5)

      XCTAssert(rleGenerator.isAtEnd() == true)
    } catch {
      XCTAssert(false, "Failed to initialize RLE Enumerator.")
    }
  }

  static var allTests = [
    ("testRLEGenerator", testRLEGenerator),
  ]
}

import XCTest
import ExpiringDictionary

class ExpiringDictionaryTests: XCTestCase {
  func testExpiringDictionary() {
    var expiringDictionary = ExpiringDictionary<String, String>()

    // No values.
    XCTAssertEqual(expiringDictionary.count(), 0)
    XCTAssertNil(expiringDictionary.value(forKey: "A"))

    // With an expired value.
    expiringDictionary.insert(key: "A", value: "value a", expirationTimeInterval: nowByAddingTimeInterval(-500))
    XCTAssertEqual(expiringDictionary.count(), 0)
    XCTAssertNil(expiringDictionary.value(forKey: "A"))

    // With a valid value.
    expiringDictionary.insert(key: "B", value: "value b", expirationTimeInterval: nowByAddingTimeInterval(500))
    XCTAssertEqual(expiringDictionary.count(), 1)
    XCTAssertEqual(expiringDictionary.value(forKey: "B"), "value b")
    XCTAssertEqual(expiringDictionary.count(), 1)

    // Updating a valid value to an invalid one.
    expiringDictionary.insert(key: "B", value: "value b", expirationTimeInterval: nowByAddingTimeInterval(-500))
    XCTAssertEqual(expiringDictionary.count(), 0)
    XCTAssertNil(expiringDictionary.value(forKey: "B"))
    XCTAssertEqual(expiringDictionary.count(), 0)

    // With an always valid value, updating a valid value to another valid one, and then to an invalid one.
    expiringDictionary.insert(key: "Z", value: "value z", expirationTimeInterval: nowByAddingTimeInterval(999))
    XCTAssertEqual(expiringDictionary.count(), 1)
    XCTAssertEqual(expiringDictionary.value(forKey: "Z"), "value z")
    XCTAssertEqual(expiringDictionary.count(), 1)
    expiringDictionary.insert(key: "B", value: "value b", expirationTimeInterval: nowByAddingTimeInterval(600))
    XCTAssertEqual(expiringDictionary.count(), 2)
    XCTAssertEqual(expiringDictionary.value(forKey: "B"), "value b")
    XCTAssertEqual(expiringDictionary.count(), 2)
    expiringDictionary.insert(key: "B", value: "value b", expirationTimeInterval: nowByAddingTimeInterval(700))
    XCTAssertEqual(expiringDictionary.count(), 2)
    XCTAssertEqual(expiringDictionary.value(forKey: "B"), "value b")
    XCTAssertEqual(expiringDictionary.count(), 2)
    expiringDictionary.insert(key: "B", value: "value b", expirationTimeInterval: nowByAddingTimeInterval(-500))
    XCTAssertEqual(expiringDictionary.count(), 1)
    XCTAssertNil(expiringDictionary.value(forKey: "B"))
    XCTAssertEqual(expiringDictionary.count(), 1)
  }

  private func nowByAddingTimeInterval(_ timeInterval: TimeInterval) -> TimeInterval {
    return Date().timeIntervalSince1970 + timeInterval
  }

  static var allTests = [
    ("testExpiringDictionary", testExpiringDictionary),
  ]
}

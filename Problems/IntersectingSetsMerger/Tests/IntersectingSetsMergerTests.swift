import XCTest
import Problems_IntersectingSetsMerger_IntersectingSetsMerger

class IntersectingSetsMergerTests: XCTestCase {
  func testMergedIntersectingSets() {
    var input: [Set<Character>] = []
    var expected: [Set<Character>] = []
    XCTAssertEqual(mergedIntersectingSets(sets: input), expected)

    input = [ Set(arrayLiteral: "a", "b", "c"), Set(arrayLiteral: "d", "e", "f") ]
    expected = input
    XCTAssertEqual(mergedIntersectingSets(sets: input), expected)

    input = [
      Set(arrayLiteral: "a", "b", "c"),
      Set(arrayLiteral: "c", "d", "e"),
      Set(arrayLiteral: "f"),
      Set(arrayLiteral: "a", "z"),
    ]
    expected = [
      Set(arrayLiteral: "a", "b", "c", "d", "e", "z"),
      Set(arrayLiteral: "f"),
    ]
    XCTAssertEqual(mergedIntersectingSets(sets: input), expected)
  }
}

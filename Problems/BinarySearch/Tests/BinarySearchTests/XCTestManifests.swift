import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
  return [
    testCase(BinarySearchTests.allTests),
  ]
}
#endif

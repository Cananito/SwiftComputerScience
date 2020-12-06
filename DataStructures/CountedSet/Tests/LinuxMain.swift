import XCTest

import CountedSet

var tests = [XCTestCaseEntry]()
tests += CountedSetTests.allTests()
XCTMain(tests)

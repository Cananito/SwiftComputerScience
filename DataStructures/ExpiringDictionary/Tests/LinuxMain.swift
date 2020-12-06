import XCTest

import ExpiringDictionary

var tests = [XCTestCaseEntry]()
tests += ExpiringDictionaryTests.allTests()
XCTMain(tests)

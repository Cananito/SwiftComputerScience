import XCTest

import Queue

var tests = [XCTestCaseEntry]()
tests += QueueTests.allTests()
XCTMain(tests)

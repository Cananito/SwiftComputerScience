import XCTest

import Fibonacci

var tests = [XCTestCaseEntry]()
tests += FibonacciTests.allTests()
XCTMain(tests)

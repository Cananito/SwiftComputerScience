//
//  LargestSumSequenceTests.swift
//  LargestSumSequenceTests
//
//  Created by Rogelio Gudino on 9/7/15.
//  Copyright © 2015 Rogelio Gudino. All rights reserved.
//

import XCTest
// TODO: Move algorithm to Algorithms folder and get rid of `@testable`.
@testable import LargestSumSequence

class LargestSumSequenceTests: XCTestCase {
    func testLargestSum() {
        XCTAssert(largestSum([2, 10, -5, 8, 2]) == 17)
        XCTAssert(largestSum([2, 10, -50, 8, 2]) == 12)
        XCTAssert(largestSum([0, 10, 0, -8, 2]) == 10)
        XCTAssert(largestSum([-2, -1, -10, -8, -1]) == -1)
        XCTAssert(largestSum([2, -1, 1, -8, -1]) == 2)
        XCTAssert(largestSum([12, -10, -1, 8, -1]) == 12)
        XCTAssert(largestSum([-1, -10, -3, -8, -7]) == -1)
        XCTAssert(largestSum([4, -9, 8, -6, 5]) == 8)
        XCTAssert(largestSum([10, -5, -3]) == 10)
    }
    
    func testLargestSumSequence() {
        XCTAssert(largestSumSequence([2, 10, -5, 8, 2]) == [2, 10, -5, 8, 2])
        XCTAssert(largestSumSequence([2, 10, -50, 8, 2]) == [2, 10])
        XCTAssert(largestSumSequence([0, 10, 0, -8, 2]) == [0, 10])
        XCTAssert(largestSumSequence([-2, -1, -10, -8, -1]) == [-1])
        XCTAssert(largestSumSequence([2, -1, 1, -8, -1]) == [2])
        XCTAssert(largestSumSequence([12, -10, -1, 8, -1]) == [12])
        XCTAssert(largestSumSequence([-1, -10, -3, -8, -7]) == [-1])
        XCTAssert(largestSumSequence([4, -9, 8, -6, 5]) == [8])
        XCTAssert(largestSumSequence([10, -5, -3]) == [10])
    }
}

//
//  NaiveStringSearchTests.swift
//  NaiveStringSearchTests
//
//  Created by Rogelio Gudino on 8/28/16.
//  Copyright © 2016 Rogelio Gudino. All rights reserved.
//

import XCTest
@testable import NaiveStringSearch

class NaiveStringSearchTests: XCTestCase {
    func testReturnsEmptyArray() {
        let substring = "World"
        let input = "Hello Universe!"
        
        let ranges = naiveStringSearch(substring, input: input)
        XCTAssert(ranges.count == 0)
    }
    
    func testReturnsOneRange() {
        let substring = "World"
        let input = "Hello Wor World!"
        
        let ranges = naiveStringSearch(substring, input: input)
        XCTAssert(ranges.count == 1)
        
        let range = ranges[0]
        XCTAssert(range == 10..<15)
    }
    
    func testReturnsThreeRanges() {
        let substring = "World"
        let input = "World, Hello Wor WorldWorld"
        
        let ranges = naiveStringSearch(substring, input: input)
        XCTAssert(ranges.count == 3)
        
        let firstRange = ranges[0]
        XCTAssert(firstRange == 0..<5)
        
        let secondRange = ranges[1]
        XCTAssert(secondRange == 17..<22)
        
        let thirdRange = ranges[2]
        XCTAssert(thirdRange == 22..<27)
    }
}

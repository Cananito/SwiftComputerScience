//
//  NaiveStringSearchTests.swift
//  NaiveStringSearchTests
//
//  Created by Rogelio Gudino on 8/28/16.
//  Copyright © 2016 Rogelio Gudino. All rights reserved.
//

import XCTest
import NaiveStringSearch

class NaiveStringSearchTests: XCTestCase {
    func testReturnsEmptyArray() {
        let pattern = "World"
        let string = "Hello Universe!"
        
        let ranges = naiveStringSearch(pattern, string: string)
        XCTAssert(ranges.count == 0)
    }
    
    func testReturnsOneRange() {
        let pattern = "World"
        let string = "Hello Wor World!"
        
        let ranges = naiveStringSearch(pattern, string: string)
        XCTAssert(ranges.count == 1)
        
        let range = ranges[0]
        XCTAssert(range == 10..<15)
    }
    
    func testReturnsThreeRanges() {
        let pattern = "World"
        let string = "World, Hello Wor WorldWorld"
        
        let ranges = naiveStringSearch(pattern, string: string)
        XCTAssert(ranges.count == 3)
        
        let firstRange = ranges[0]
        XCTAssert(firstRange == 0..<5)
        
        let secondRange = ranges[1]
        XCTAssert(secondRange == 17..<22)
        
        let thirdRange = ranges[2]
        XCTAssert(thirdRange == 22..<27)
    }
}

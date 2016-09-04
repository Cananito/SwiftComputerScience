//
//  BoyerMooreTests.swift
//  StringSearchingTests
//
//  Created by Rogelio Gudino on 8/28/16.
//  Copyright © 2016 Rogelio Gudino. All rights reserved.
//

import XCTest
import StringSearching

class BoyerMooreTests: XCTestCase {
    func testReturnsEmptyArray() {
        let pattern = BoyerMoorePattern(string: "World")
        let document = "Hello Universe!"
        
        let ranges = boyerMooreStringSearch(pattern, document: document)
        XCTAssert(ranges.count == 0)
    }
    
    func testReturnsOneRange() {
        let pattern = BoyerMoorePattern(string: "World")
        let document = "Hello Wor World!"
        
        let ranges = boyerMooreStringSearch(pattern, document: document)
        XCTAssert(ranges.count == 1)
        
        let range = ranges[0]
        XCTAssert(range == 10..<15)
    }
    
    func testReturnsThreeRanges() {
        let pattern = BoyerMoorePattern(string: "World")
        let document = "World, Hello Wor WorldWorld"
        
        let ranges = boyerMooreStringSearch(pattern, document: document)
        XCTAssert(ranges.count == 3)
        
        let firstRange = ranges[0]
        XCTAssert(firstRange == 0..<5)
        
        let secondRange = ranges[1]
        XCTAssert(secondRange == 17..<22)
        
        let thirdRange = ranges[2]
        XCTAssert(thirdRange == 22..<27)
    }
    
    func testMiscCases() {
        var pattern = BoyerMoorePattern(string: "needle")
        var document = "Find a needle in a haystack"
        var patternRanges = boyerMooreStringSearch(pattern, document: document)
        XCTAssert(patternRanges.count == 1)
        XCTAssert(patternRanges[0] == 7..<13)
        
        pattern = BoyerMoorePattern(string: "orl")
        document = "Hello World!"
        patternRanges = boyerMooreStringSearch(pattern, document: document)
        XCTAssert(patternRanges.count == 1)
        XCTAssert(patternRanges[0] == 7..<10)
        
        pattern = BoyerMoorePattern(string: "World")
        document = "Wo"
        patternRanges = boyerMooreStringSearch(pattern, document: document)
        XCTAssert(patternRanges.count == 0)
    }
}

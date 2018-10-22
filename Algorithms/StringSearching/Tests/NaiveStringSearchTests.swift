//
//  NaiveStringSearchTests.swift
//  StringSearching
//
//  Created by Rogelio Gudino on 8/28/16.
//  Copyright © 2016 Rogelio Gudino. All rights reserved.
//

import XCTest
import Algorithms_StringSearching_StringSearching

class NaiveStringSearchTests: XCTestCase {
    func testReturnsEmptyArray() {
        let pattern = "World"
        let string = "Hello Universe!"
        
        let ranges = naiveStringSearch(pattern: pattern, string: string)
        XCTAssert(ranges.count == 0)
    }
    
    func testReturnsOneRange() {
        let pattern = "World"
        let string = "Hello Wor World!"
        
        let ranges = naiveStringSearch(pattern: pattern, string: string)
        XCTAssert(ranges.count == 1)
        
        let range = ranges[0]
        XCTAssert(range == 10..<15)
    }
    
    func testReturnsThreeRanges() {
        let pattern = "World"
        let string = "World, Hello Wor WorldWorld"
        
        let ranges = naiveStringSearch(pattern: pattern, string: string)
        XCTAssert(ranges.count == 3)
        
        let firstRange = ranges[0]
        XCTAssert(firstRange == 0..<5)
        
        let secondRange = ranges[1]
        XCTAssert(secondRange == 17..<22)
        
        let thirdRange = ranges[2]
        XCTAssert(thirdRange == 22..<27)
    }
    
    func testMiscCases() {
        var pattern = "needle"
        var string = "Find a needle in a haystack"
        var patternRanges = naiveStringSearch(pattern: pattern, string: string)
        XCTAssert(patternRanges.count == 1)
        XCTAssert(patternRanges[0] == 7..<13)
        
        pattern = "orl"
        string = "Hello World!"
        patternRanges = naiveStringSearch(pattern: pattern, string: string)
        XCTAssert(patternRanges.count == 1)
        XCTAssert(patternRanges[0] == 7..<10)
        
        pattern = "World"
        string = "Wo"
        patternRanges = naiveStringSearch(pattern: pattern, string: string)
        XCTAssert(patternRanges.count == 0)
    }
    
    func testSpeedPerformanceSmall() {
        let loremIpsumPath = Bundle(for: NaiveStringSearchTests.self).path(forResource: "LoremIpsum-Small", ofType: "txt")!
        let string = (try! NSString(contentsOfFile: loremIpsumPath, encoding: String.Encoding.utf8.rawValue)) as String
        let pattern = "Maecenas"
        self.measure {
            let patternRanges = naiveStringSearch(pattern: pattern, string: string)
            XCTAssert(patternRanges.count == 3)
        }
    }
}

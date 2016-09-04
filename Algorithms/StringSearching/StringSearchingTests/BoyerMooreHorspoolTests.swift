//
//  BoyerMooreHorspoolTests.swift
//  StringSearchingTests
//
//  Created by Rogelio Gudino on 9/4/16.
//  Copyright © 2016 Rogelio Gudino. All rights reserved.
//

import XCTest
import StringSearching

class BoyerMooreHorspoolTests: XCTestCase {
    func testReturnsEmptyArray() {
        let pattern = BoyerMooreHorspoolPattern(string: "World")
        let document = "Hello Universe!"
        
        let ranges = boyerMooreHorspoolStringSearch(pattern, document: document)
        XCTAssert(ranges.count == 0)
    }
    
    func testReturnsOneRange() {
        let pattern = BoyerMooreHorspoolPattern(string: "World")
        let document = "Hello Wor World!"
        
        let ranges = boyerMooreHorspoolStringSearch(pattern, document: document)
        XCTAssert(ranges.count == 1)
        
        let range = ranges[0]
        XCTAssert(range == 10..<15)
    }
    
    func testReturnsThreeRanges() {
        let pattern = BoyerMooreHorspoolPattern(string: "World")
        let document = "World, Hello Wor WorldWorld"
        
        let ranges = boyerMooreHorspoolStringSearch(pattern, document: document)
        XCTAssert(ranges.count == 3)
        
        let firstRange = ranges[0]
        XCTAssert(firstRange == 0..<5)
        
        let secondRange = ranges[1]
        XCTAssert(secondRange == 17..<22)
        
        let thirdRange = ranges[2]
        XCTAssert(thirdRange == 22..<27)
    }
    
    func testMiscCases() {
        var pattern = BoyerMooreHorspoolPattern(string: "needle")
        var document = "Find a needle in a haystack"
        var patternRanges = boyerMooreHorspoolStringSearch(pattern, document: document)
        XCTAssert(patternRanges.count == 1)
        XCTAssert(patternRanges[0] == 7..<13)
        
        pattern = BoyerMooreHorspoolPattern(string: "orl")
        document = "Hello World!"
        patternRanges = boyerMooreHorspoolStringSearch(pattern, document: document)
        XCTAssert(patternRanges.count == 1)
        XCTAssert(patternRanges[0] == 7..<10)
        
        pattern = BoyerMooreHorspoolPattern(string: "World")
        document = "Wo"
        patternRanges = boyerMooreHorspoolStringSearch(pattern, document: document)
        XCTAssert(patternRanges.count == 0)
    }
    
    func testSpeedPerformanceSmall() {
        let loremIpsumPath = NSBundle(forClass: BoyerMooreHorspoolTests.self).pathForResource("LoremIpsum-Small", ofType: "txt")!
        let document = (try! NSString(contentsOfFile: loremIpsumPath, encoding: NSUTF8StringEncoding)) as String
        let pattern = BoyerMooreHorspoolPattern(string: "Maecenas")
        self.measureBlock {
            let patternRanges = boyerMooreHorspoolStringSearch(pattern, document: document)
            XCTAssert(patternRanges.count == 3)
        }
    }
    
    func testSpeedPerformanceBig() {
        let loremIpsumPath = NSBundle(forClass: BoyerMooreHorspoolTests.self).pathForResource("LoremIpsum-Big", ofType: "txt")!
        let document = (try! NSString(contentsOfFile: loremIpsumPath, encoding: NSUTF8StringEncoding)) as String
        let pattern = BoyerMooreHorspoolPattern(string: "inceptos himenaeos.")
        self.measureBlock {
            let patternRanges = boyerMooreHorspoolStringSearch(pattern, document: document)
            XCTAssert(patternRanges.count == 5)
        }
    }
}

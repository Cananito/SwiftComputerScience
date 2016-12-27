//
//  AnagramFinderTests.swift
//  AnagramFinderTests
//
//  Created by Rogelio Gudino on 2/14/15.
//  Copyright (c) 2015 Rogelio Gudino. All rights reserved.
//

import Cocoa
import XCTest
import AnagramFinder

class AnagramFinderTests: XCTestCase {
    func testAnagramClusterer() {
        // Empty.
        var words = [String]()
        var expected = [String: [String]]()
        var result = clusterArrayOfWords(words)
        XCTAssertTrue(self.wordClustersAreEqual(expected, result))
        
        // Values not equal to sorted keys.
        words = ["cab", "cba",
                 "bab"]
        expected = ["abc": ["cab", "cba"],
                    "abb": ["bab"]]
        result = clusterArrayOfWords(words)
        XCTAssertTrue(self.wordClustersAreEqual(expected, result))
        
        // Many values, including equal to sorted keys.
        words = ["abc", "acb", "bac", "bca", "cab", "cba",
                 "abb", "bab", "bba"]
        expected = ["abc": ["abc", "acb", "bac", "bca", "cab", "cba"],
                    "abb": ["abb", "bab", "bba"]]
        result = clusterArrayOfWords(words)
        XCTAssertTrue(self.wordClustersAreEqual(expected, result))
        
        // Missing keys or values.
        expected = ["abc": ["abc"],
                    "abb": ["abb"]]
        XCTAssertFalse(self.wordClustersAreEqual(expected, result))
        expected = ["abc": ["abc"],
                    "zzz": ["zzz"]]
        XCTAssertFalse(self.wordClustersAreEqual(expected, result))
        expected = ["abc": ["abc"]]
        XCTAssertFalse(self.wordClustersAreEqual(expected, result))
    }
    
    private func wordClustersAreEqual(_ lhs: [String: [String]], _ rhs: [String: [String]]) -> Bool {
        if lhs.keys.count != rhs.keys.count {
            return false
        }
        for (key, leftValue) in lhs {
            if let rightValue = rhs[key] {
                if leftValue != rightValue {
                    return false
                }
            } else {
                return false
            }
        }
        return true
    }
}
